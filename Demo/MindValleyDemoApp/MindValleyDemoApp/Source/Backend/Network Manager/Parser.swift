//
//  Parser.swift
//  MindValleyDemoApp
//
//  Created by Pranil on 2/12/19.
//  Copyright © 2019 pranil. All rights reserved.
//

import Foundation

struct Parser {

    static func parse<T: Decodable>(_ data: Data?) -> T? {

        guard let _data = data else {
            return nil
        }
        do {

            let genericModel = try JSONDecoder().decode(T.self, from: _data)
            return genericModel
        }
        catch {

            print(error)
            return nil
        }
    }
}
