//
//  CharacterDetailViewModel.swift
//  Meetup MVVM
//
//  Created by Faruk Kesan on 30/11/2018.
//  Copyright © 2018 Faruk. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class CharacterDetailViewModel: NSObject {

    let bag: DisposeBag = DisposeBag()
    let title = Variable<String>("Character Details")
    
    var thumbnail: Driver<URL?>!
    var name: Driver<String?>!
    var species: Driver<String?>!

    init(character: Character) {
        super.init()

        name = Driver.just("Name: " + character.name)
        species = Driver.just("Species: " + character.species)
        thumbnail = Driver.just(URL(string: character.image))
    }
}
