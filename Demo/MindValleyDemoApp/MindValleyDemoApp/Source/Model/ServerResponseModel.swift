//
//  ServerResponseModel.swift
//  MindValleyDemoApp
//
//  Created by Pranil on 2/13/19.
//  Copyright © 2019 pranil. All rights reserved.
//

import Foundation

struct ServerResponseModel: Decodable {

    var serverResponse: [ServerResponse]?
}

struct ServerResponse: Decodable {

    var id: String?
    var created_at: String?
    var width: Int?
    var height: Int?
    var color: String?
    var likes: Int?
    var liked_by_user: Bool?
    var user: UserModel?
    var current_user_collections: [String]?
    var urls: URLModel?
    var categories: [CategoryModel]?
    var links: Link?
}

struct URLModel: Decodable {
    var raw: String?
    var full: String?
    var regular: String?
    var small: String?
    var thumb: String?
}

struct CategoryModel: Decodable {
    var id: String?
    var title: String?
    var photo_count: String?
    var links: Link?
}
