//
//  CharactersController.swift
//  Meetup MVVM
//
//  Created by Faruk Kesan on 20/02/2019.
//  Copyright © 2019 Faruk. All rights reserved.
//

import UIKit
import RxSwift

class CharactersController: NSObject {

    static let shared = CharactersController()

    //Dispose bag
    private let disposeBag = DisposeBag()

    func getCharacters() -> Observable<Characters> {
        return ApiClient.shared.request(ApiRouter.getCharacters())
    }
}
