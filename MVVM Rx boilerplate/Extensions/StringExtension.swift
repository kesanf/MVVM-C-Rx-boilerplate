//
//  StringExtension.swift
//  MVVM Rx boilerplate
//
//  Created by Faruk Kesan on 05/03/2019.
//  Copyright © 2019 Faruk. All rights reserved.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: self)
    }
}
