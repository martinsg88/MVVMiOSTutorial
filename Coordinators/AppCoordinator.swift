//
//  AppCoordinator.swift
//  MVVMTutorial
//
//  Created by Guilherme Martins on 2022/06/11.
//

import Foundation
import UIKit


class AppCoordinator {
    
    private let window: UIWindow
    
    init(window: UIWindow) { self.window = window }
    
    func start() {
        let viewController = RestaurantListViewController.instantiate(viewModel: RestaurantsListViewModel())
        let navigationController = MVVMTuTNavBar(rootViewController: viewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
}
