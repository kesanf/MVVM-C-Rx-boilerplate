//
//  CharactersListViewController.swift
//  Meetup MVVM
//
//  Created by Faruk Kesan on 30/11/2018.
//  Copyright © 2018 Faruk. All rights reserved.
//

import UIKit
import RxSwift
import SnapKit

class CharactersListViewController: UIViewController {

    var viewModel: CharactersListViewModel!
    let bag = DisposeBag()

    lazy var tableView: UITableView = {
        let table = UITableView()
        table.dataSource = self
        table.delegate = self

        // Color example
        table.backgroundColor = Colors.Color.white
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        view.addSubview(tableView)

        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension CharactersListViewController: BindableType {

    func bindViewModel() {

        viewModel.title.asDriver().drive(navigationItem.rx.title).disposed(by: bag)

        viewModel.characters
            .asObservable()
            .subscribe(onNext: { [weak self] _ in
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            }).disposed(by: bag)
    }
}
