//
//  ViewController.swift
//  MVVMTutorial
//
//  Created by Guilherme Martins on 2022/06/11.
//

import UIKit
import RxSwift
import RxCocoa

class RestaurantListViewController: UIViewController {

    let disposeBag = DisposeBag()
    private var viewModel: RestaurantsListViewModel!
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false 
        return tableView
    }()
    
    private lazy var tableViewCell: UITableViewCell = {
        let tableViewCell = UITableViewCell()
        return tableViewCell
    }()
    
    static func instantiate(viewModel: RestaurantsListViewModel) -> RestaurantListViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let viewController = storyboard.instantiateInitialViewController() as! RestaurantListViewController
        viewController.viewModel = viewModel
        return viewController
    }
    
    override func viewDidLoad() {
        setupTableView()
        super.viewDidLoad()
    }
}

extension RestaurantListViewController {
    private func setupTableView() {
        setupTableViewMargins()
        setupTableViewCells()
        setupTableViewData()
        
    }
    
    private func setupTableViewCells() {
        tableView.register(tableViewCell.classForCoder, forCellReuseIdentifier: "cell")
    }
    
    private func setupTableViewData() {
        viewModel.fetchRestaurantViewModels().bind(to: tableView.rx.items(cellIdentifier: "cell")) { index, viewModel, cell in
            cell.textLabel?.text = viewModel.displayText
        }.disposed(by: disposeBag)
    }
    
    private func setupTableViewMargins() {
        self.view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            tableView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor)
        ])
    }
    
    
}

