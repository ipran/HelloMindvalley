//
//  DataManager.swift
//  MindValleyDemoApp
//
//  Created by Pranil on 2/13/19.
//  Copyright © 2019 pranil. All rights reserved.
//

import Foundation
import UIKit

class DataManager: NSObject {

    static let shared = DataManager()
    let networkRequest = NetworkRequest()
    let messages = Messages()
    let keys = GetPostKeys()
    lazy var queue : OperationQueue = {
        let queue = OperationQueue()
        queue.maxConcurrentOperationCount = 1
        queue.qualityOfService = .background
        return queue
    }()

    private override init() {
        super.init()
    }
}

extension DataManager {
    func fetchServerData(_ completion: @escaping(_ status: Bool, _ statusMessage: String, _ serverResponseModel: ServerResponseModel?) -> ()) {
        // Send Request
        networkRequest.request(to: APIEndpoint.baseUrl, method: HTTPMethod.get, headers: HTTPHeaders(), queryParams: Parameters(), body: Data()) { (networkStatus, responseStatus, data) in
            // Network error case
            if !networkStatus {
                completion(false, self.messages.noConnection, nil)
                return
            }
            // Success case
            if let serverResponse: ServerResponseModel = Parser.parse(data) {
                completion(true,self.messages.success,serverResponse)
                return
            }
            completion(false,self.messages.serverNotResponding,nil)
        }
    }

}
