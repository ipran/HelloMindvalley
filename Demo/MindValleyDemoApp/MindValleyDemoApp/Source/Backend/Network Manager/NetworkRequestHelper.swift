//
//  NetworkRequestHelper.swift
//  MindValleyDemoApp
//
//  Created by Pranil on 2/12/19.
//  Copyright © 2019 pranil. All rights reserved.
//

import Foundation

public typealias Parameters = [String: Any]
public typealias HTTPHeaders = [String: String]


public enum HTTPMethod: String {

    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"

    var name: String {
        return self.rawValue
    }
}


public enum HTTPEncoding {

    case queryUrl, json
}

// Endpoint URL's
enum APIEndpoint: String {

    case baseUrl = "http://pastebin.com/raw/wgkJgazE"
    case void = "MaindValleyDemoApp"

    var url: URL? {

        return URL(string: self.rawValue)
    }
    var string: String {

        return self.rawValue
    }
}

// Support Keys in GET and POST
struct GetPostKeys {

    // Support Header
    let token = "token"
    let contentType = "content-type"

}


func generateRequestBody(from params: Parameters) -> Data {

    // Preapre Query URL
    var body = Data()
    if params.count > 0 {

        do {

            body = try JSONSerialization.data(withJSONObject: params, options: [])
            return body
        } catch {

            print(Messages().requestBodyGenerationFailed)
            return body
        }
    }
    return body
}



func generateRequestBody<T: Codable>(from params: T) -> Data {

    // Preapre Query URL
    var body = Data()
    do {

        body = try JSONEncoder().encode(params)
        return body
    } catch {

        print(Messages().requestBodyGenerationFailed)
        return body
    }
}
