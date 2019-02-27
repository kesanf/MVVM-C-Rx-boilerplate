//
//  Coordinator.swift
//  Meetup MVVM
//
//  Created by Faruk Kesan on 02/12/2018.
//  Copyright © 2018 Faruk. All rights reserved.
//

import Foundation

public protocol Coordinator: class {
    /// The array containing any child Coordinators
    var childCoordinators: [AppChildCoordinator: Coordinator] { get set }

    /// A function that handle flow start
    func start()

    /// A function that handle flow finish
    func finish()
}
