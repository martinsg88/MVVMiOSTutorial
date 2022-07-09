//
//  RestaurantViewModel.swift
//  MVVMTutorial
//
//  Created by Guilherme Martins on 2022/06/11.
//

import Foundation

struct RestaurantViewModel {
    
    private let restaurant: Restaurant
    
    var displayText: String {
        return restaurant.name + " - " + restaurant.cuisine.rawValue.capitalized
    }

    init(restaurant: Restaurant) {
        self.restaurant = restaurant
    }
}
