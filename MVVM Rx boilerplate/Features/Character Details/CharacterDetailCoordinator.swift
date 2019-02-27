//
//  CharacterDetailsCoordinator.swift
//  Meetup MVVM
//
//  Created by Faruk Kesan on 20/02/2019.
//  Copyright © 2019 Faruk. All rights reserved.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class CharacterDetailCoordinator: Coordinator, Presentable {

    // MARK: - Properties
    var childCoordinators: [AppChildCoordinator: Coordinator] = [:]
    var router: Router

    var rootViewController: UINavigationController {
        return self.router.navigationController
    }

    var characterDetailViewController: CharacterDetailViewController

    let bag = DisposeBag()

    public init(router: Router, character: Character) {
        self.router = router

        characterDetailViewController = CharacterDetailViewController()
        let characterDetailViewModel = CharacterDetailViewModel(character: character)
        characterDetailViewController.bind(to: characterDetailViewModel)
    }

    func start() {
        debugPrint("Character details flow started.")
    }

    func finish() {
        debugPrint("Character details flow finished.")
    }

    func toPresentable() -> UIViewController {
        return characterDetailViewController
    }
}
