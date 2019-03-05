//
//  BindableType.swift
//  Meetup MVVM
//
//  Created by Faruk Kesan on 02/12/2018.
//  Copyright © 2018 Faruk. All rights reserved.
//

import UIKit

/**

 Each view controller conforming to the BindableType protocol
 will declare a viewModel variable and provide a bindViewModel() function
 to be called once the viewModel variable is assigned.
 This function will connect UI elements to observables and actions in the view model.

 */

protocol BindableType {
    
    associatedtype ViewModelType

    var viewModel: ViewModelType! { get set }
    func bindViewModel()
}

extension BindableType where Self: UIViewController {

    mutating func bind(to model: Self.ViewModelType) {
        viewModel = model
        loadViewIfNeeded()
        bindViewModel()
    }
}
