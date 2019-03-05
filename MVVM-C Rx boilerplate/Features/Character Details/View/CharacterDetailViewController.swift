//
//  CharacterDetailViewController.swift
//  Meetup MVVM
//
//  Created by Faruk Kesan on 30/11/2018.
//  Copyright © 2018 Faruk. All rights reserved.
//

import UIKit
import RxSwift
import SnapKit

class CharacterDetailViewController: UIViewController {

    var viewModel: CharacterDetailViewModel!
    let bag = DisposeBag()

    lazy var imageView: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.layer.masksToBounds = true
        image.contentMode = .scaleAspectFit
        return image
    }()

    lazy var nameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        return label
    }()

    lazy var speciesLabel: UILabel = {
        let label = UILabel(frame: .zero)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        view.backgroundColor = .white
        view.addSubview(imageView)
        view.addSubview(nameLabel)
        view.addSubview(speciesLabel)

        imageView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(imageView.snp.width)
        }

        nameLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().inset(20)
            make.top.equalTo(imageView.snp.bottom).offset(20)
        }

        speciesLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().inset(20)
            make.top.equalTo(nameLabel.snp.bottom).offset(20)
        }
    }
}

extension CharacterDetailViewController: BindableType {

    func bindViewModel() {

        viewModel.title.asDriver().drive(navigationItem.rx.title).disposed(by: bag)

        viewModel.name.asDriver().drive(nameLabel.rx.text).disposed(by: bag)
        viewModel.species.asDriver().drive(speciesLabel.rx.text).disposed(by: bag)
        viewModel.thumbnail.asDriver().drive(imageView.rx.thumbnail).disposed(by: bag)
    }
}
