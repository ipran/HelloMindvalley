//
//  UserModel.swift
//  MindValleyDemoApp
//
//  Created by Pranil on 2/13/19.
//  Copyright © 2019 pranil. All rights reserved.
//

import Foundation

struct UserModel: Decodable {

    var id: String?
    var username: String?
    var name: String?
    var profile_image: ProfileImage?
    var links: Link?
}

struct ProfileImage: Decodable {

    var small: String?
    var medium: String?
    var large: String?
}

struct Link: Decodable {

    var `self`: String?
    var html: String?
    var photos: String?
    var likes: String?
    var download: String?
}
