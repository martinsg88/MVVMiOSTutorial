//
//  Restaruant.swift
//  MVVMTutorial
//
//  Created by Guilherme Martins on 2022/06/11.
//

import Foundation

struct Restaurant: Decodable {
    let name: String
    let cuisine: Cuisine
}

enum Cuisine: String, Decodable {
    case european
    case indian
    case mexican
    case french
    case english
}
