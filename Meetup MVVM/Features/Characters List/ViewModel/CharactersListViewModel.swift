//
//  CharactersListViewModel.swift
//  Meetup MVVM
//
//  Created by Faruk Kesan on 30/11/2018.
//  Copyright © 2018 Faruk. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class CharactersListViewModel: NSObject {

    let bag: DisposeBag = DisposeBag()
    var dataReady = Variable<Bool>(false)
    let title = Variable<String>("Characters")
    
    let characters = Variable<[Character]>([])

    let selectCharacterDetailsAction = PublishSubject<Character>()
    let openCharacterDetailsAction = PublishSubject<Character>()

    override init() {
        super.init()
        fetchCharacters()

        selectCharacterDetailsAction.bind(to: openCharacterDetailsAction).disposed(by: bag)
    }

    func fetchCharacters() {
        CharactersController.shared.getCharacters().subscribe(onNext: { [weak self] characters in
            self?.characters.value = characters.results
            self?.dataReady.value = true

            }, onError: { error in
                print(error)
        }).disposed(by: bag)
    }
}
