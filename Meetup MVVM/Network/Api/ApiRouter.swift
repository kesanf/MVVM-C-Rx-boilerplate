//
//  ApiRouter.swift
//  Meetup MVVM
//
//  Created by Faruk Kesan on 20/02/2019.
//  Copyright © 2019 Faruk. All rights reserved.
//

import Foundation
import Alamofire

enum ApiRouter: URLRequestConvertible {

    //The endpoint name we'll call later
    case getCharacters()

    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try Constants.baseUrl.asURL()

        var urlRequest = URLRequest(url: url.appendingPathComponent(path))

        //Http method
        urlRequest.httpMethod = method.rawValue

        // Common Headers
        urlRequest.setValue(Constants.ContentType.json.rawValue,
                            forHTTPHeaderField: Constants.HttpHeaderField.acceptType.rawValue)
        urlRequest.setValue(Constants.ContentType.json.rawValue,
                            forHTTPHeaderField: Constants.HttpHeaderField.contentType.rawValue)

        //Encoding
        let encoding: ParameterEncoding = {
            switch method {
            case .get:
                return URLEncoding.default
            default:
                return JSONEncoding.default
            }
        }()

        return try encoding.encode(urlRequest, with: nil)
    }

    // MARK: - HttpMethod
    //This returns the HttpMethod type. It's used to determine the type if several endpoints are peresent
    private var method: HTTPMethod {
        switch self {
        case .getCharacters:
            return .get
        }
    }

    // MARK: - Path
    //The path is the part following the base url
    private var path: String {
        switch self {
        case .getCharacters:
            return "api/character/"
        }
    }
}
