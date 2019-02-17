//
//  NetworkRequest.swift
//  MindValleyDemoApp
//
//  Created by Pranil on 2/12/19.
//  Copyright © 2019 pranil. All rights reserved.
//

import Foundation

struct NetworkRequest {
    
    // Declarations
    fileprivate let messages = Messages()
    fileprivate let keys = GetPostKeys()
    
    // Prepare Request
    fileprivate func buildRequest(to path: APIEndpoint, method: HTTPMethod, headers: HTTPHeaders, queryParams: Parameters, body: Data) -> URLRequest? {
        
        
        // Temperory - Enbale following after domain set
        guard let url = path.url, var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true) else {
            return nil
            
        }
        
        // Preapre Query URL
        urlComponents.queryItems = generateQueryParams(queryParams)
        
        
        // Prepare final URL
        guard let completeURL = urlComponents.url else {
            return nil
            
        }
        
        // Prepare Request
        var request = URLRequest(url: completeURL)
        request.httpMethod = method.name
        request.cachePolicy = getcachePolicy(for: path)
        request.allHTTPHeaderFields = generateHeaders(headers)
        request.httpBody = body
        return request
    }
}


extension NetworkRequest {

    fileprivate func generateQueryParams(_ params: Parameters) -> [URLQueryItem] {

        // Preapre Query URL
        var queryItems: [URLQueryItem] = []
        if params.count > 0 {

            params.forEach { (key, value) in
                queryItems.append(URLQueryItem(name: key, value: "\(value)"))
            }
        }
        return queryItems
    }

    // Support Authentication
    fileprivate func generateHeaders(_ header: HTTPHeaders) -> HTTPHeaders {

        var updatedHeaders = header
        updatedHeaders[keys.contentType] = "application/json"
        return updatedHeaders
    }

    // Caching
    fileprivate func getcachePolicy(for endPoint: APIEndpoint) -> URLRequest.CachePolicy {

        switch endPoint {

        default:
            return .useProtocolCachePolicy
        }
    }
}



extension NetworkRequest {

    func request(to path: APIEndpoint, method: HTTPMethod, headers: HTTPHeaders, queryParams: Parameters, body: Data, completion: @escaping (_ networkStatus: Bool, _ responseStatus: Bool, _ data: Data?) -> ()) {

        // Connection Validation
        guard Reachability().isConnected() else {

            return completion(false, false, nil)
        }

        // Prepare request
        let session = URLSession.shared
        guard let request = buildRequest(to: path, method: method, headers: headers, queryParams: queryParams, body: body) else {

            return completion(true, false, nil)
        }

        let task = session.dataTask(with: request) { (data, response, error) in

            // Validation
            if let _ = error {

                completion(true, false, nil)
            }

            // Notify parent with response data
            completion(true, true, data)
        }
        task.resume()
    }
}
