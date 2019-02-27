//
//  CharacterCoordinator.swift
//  Meetup MVVM
//
//  Created by Faruk Kesan on 30/11/2018.
//  Copyright © 2018 Faruk. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

class CharacterListCoordinator: Coordinator {

    // MARK: - Properties
    var childCoordinators: [AppChildCoordinator: Coordinator] = [:]

    var rootViewController: UINavigationController {
        return self.navigationController
    }

    private lazy var navigationController: UINavigationController = {
        let navigationController = UINavigationController()
        return navigationController
    }()

    var charactersListViewController: CharactersListViewController
    let bag = DisposeBag()

    // MARK: - Init
    public init() {
        charactersListViewController = CharactersListViewController()
        let charactersListViewModel = CharactersListViewModel()
        charactersListViewController.bind(to: charactersListViewModel)
        navigationController.setViewControllers([charactersListViewController], animated: false)
        navigationController.navigationBar.prefersLargeTitles = true

        charactersListViewModel.openCharacterDetailsAction.subscribe(onNext: { [weak self] in
            self?.startCharacterDetailsFlow(character: $0)
        }).disposed(by: bag)
    }

    // MARK: - Functions
    func start() {
        debugPrint("Character list flow started.")
    }

    func finish() {
        debugPrint("Character list flow finished.")
    }
}

extension CharacterListCoordinator {

    private func startCharacterDetailsFlow(character: Character) {
        print("Start Character Details flow")

        let router = Router(navigationController: navigationController)
        let characterDetailCoordinator = CharacterDetailCoordinator(router: router, character: character)
        characterDetailCoordinator.start()

        childCoordinators[.details] = characterDetailCoordinator

        // Push presentation
        router.push(characterDetailCoordinator, animated: true, completion: { [weak self] in
            print("Finished Character Details flow")
            self?.childCoordinators.removeValue(forKey: .details)
        })
    }
}
