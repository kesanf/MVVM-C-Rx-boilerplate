//
//  CharacterService.swift
//  Meetup MVVM
//
//  Created by Faruk Kesan on 27/02/2019.
//  Copyright © 2019 Faruk. All rights reserved.
//

import UIKit
import Moya

enum CharacterService {
    case getCharacters()
}

// MARK: - TargetType Protocol Implementation
extension CharacterService: TargetType {

    var baseURL: URL { return URL(string: "https://rickandmortyapi.com")! }

    var path: String {
        switch self {
        case .getCharacters:
            return "/api/character/"
        }
    }

    var method: Moya.Method {
        switch self {
        case .getCharacters:
            return .get
        }
    }

    var task: Task {
        switch self {
        case .getCharacters:
            return .requestPlain
        }
    }

    var sampleData: Data {
        return Data()
    }
    
    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
}
