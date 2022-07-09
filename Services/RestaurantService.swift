//
//  RestaurantService.swift
//  MVVMTutorial
//
//  Created by Guilherme Martins on 2022/06/11.
//

import Foundation
import RxSwift

protocol RestaurantServiceProtocol {
    func fetchRestaurants() -> Observable<[Restaurant]>
}

class RestaurantService: RestaurantServiceProtocol {
    
    func fetchRestaurants() -> Observable<[Restaurant]> {
        return Observable.create { observer -> Disposable in
            guard let path = Bundle.main.path(forResource: "restaurants", ofType: "json") else {
                observer.onError(NSError(domain: "", code: -1))
                return Disposables.create{ }
            }
            
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let restaurants = try JSONDecoder().decode([Restaurant].self, from: data)
                observer.onNext(restaurants)
            } catch {
                observer.onError(error)
            }
            
            return Disposables.create {}
        }
    }
}
