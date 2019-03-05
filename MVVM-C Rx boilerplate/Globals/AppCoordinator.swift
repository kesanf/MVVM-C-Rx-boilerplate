//
//  AppCoordinator.swift
//  Meetup MVVM
//
//  Created by Faruk Kesan on 02/12/2018.
//  Copyright © 2018 Faruk. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

public enum AppChildCoordinator {
    case list
    case details
}

class AppCoordinator: NSObject {

    var childCoordinators: [AppChildCoordinator: Coordinator] = [:]
    let window: UIWindow
    let bag = DisposeBag()

    public init(window: UIWindow) {
        self.window = window
        self.window.makeKeyAndVisible()
    }

    @objc func start() {
        startCharacterListFlow()
    }
}

extension AppCoordinator {

    private func startCharacterListFlow() {
        let characterListCoordinator = CharacterListCoordinator()
        characterListCoordinator.start()

        window.rootViewController = characterListCoordinator.rootViewController

        childCoordinators[.list] = characterListCoordinator
    }
}
