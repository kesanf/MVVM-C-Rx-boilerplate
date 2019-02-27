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
import Moya

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
        let provider = MoyaProvider<CharacterService>()
        provider.request(.getCharacters()) { [weak self] result in
            guard let self = self else { return }

            switch result {
            case .success(let response):
                do {
                    let characters = try response.map(Characters.self)
                    self.characters.value = characters.results
                    self.dataReady.value = true
                } catch {
                    print("error")
                }
            case .failure:
                print("failure")
            }
        }
    }
}
