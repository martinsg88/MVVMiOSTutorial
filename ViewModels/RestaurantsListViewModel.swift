//
//  RestaurantsListViewModel.swift
//  MVVMTutorial
//
//  Created by Guilherme Martins on 2022/06/11.
//

import Foundation
import RxSwift

final class RestaurantsListViewModel {
    
    let title = "Restaurants"
    private let restaurantService: RestaurantServiceProtocol
    
    init(restaurantService: RestaurantServiceProtocol = RestaurantService()) {
        self.restaurantService = restaurantService
    }
    
    func fetchRestaurantViewModels() -> Observable<[RestaurantViewModel]>{
        return restaurantService.fetchRestaurants().map{ $0.map{ RestaurantViewModel(restaurant: $0) } }
    }
    
}
