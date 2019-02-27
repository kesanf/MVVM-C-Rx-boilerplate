//
//  Constants.swift
//  Meetup MVVM
//
//  Created by Faruk Kesan on 20/02/2019.
//  Copyright © 2019 Faruk. All rights reserved.
//

struct Constants {

    //The API's base URL
    static let baseUrl = "https://rickandmortyapi.com/"

    //The header fields
    enum HttpHeaderField: String {
        case contentType = "Content-Type"
        case acceptType = "Accept"
        case acceptEncoding = "Accept-Encoding"
    }

    //The content type (JSON)
    enum ContentType: String {
        case json = "application/json"
    }
}
