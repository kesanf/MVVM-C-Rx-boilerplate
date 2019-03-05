//
//  UIImageViewExtension.swift
//  Meetup MVVM
//
//  Created by Faruk Kesan on 20/02/2019.
//  Copyright © 2019 Faruk. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import Kingfisher

extension Reactive where Base: UIImageView {
    // Bindable sink for attributed placeholder
    var thumbnail: Binder<URL?> {
        return Binder(self.base) { field, value in
            var field = field
            field.kf.indicatorType = .activity
            field.kf.setImage(with: value, placeholder: nil, options: [.transition(.fade(0.2))])
        }
    }
}
