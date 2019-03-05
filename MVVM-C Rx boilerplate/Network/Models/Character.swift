//
//  Character.swift
//  Meetup MVVM
//
//  Created by Faruk Kesan on 30/11/2018.
//  Copyright © 2018 Faruk. All rights reserved.
//

import UIKit

struct Characters: Codable {
    let results: [Character]
}

struct Character: Codable {
    let name: String
    let image: String
    let species: String
}
