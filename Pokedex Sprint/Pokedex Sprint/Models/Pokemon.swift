//
//  Pokemon.swift
//  Pokedex Sprint
//
//  Created by Alex Shillingford on 6/21/19.
//  Copyright © 2019 Alex Shillingford. All rights reserved.
//

import Foundation
// MARK: - Structs
struct Pokemon: Codable {
    let name: String
//    let type: String
    let id: Int
    let abilities: [AbilityInfo]
}

//struct Types: Codable {
//    let types: [Type]
//}

//struct Type: Codable {
//    let name: String
//}

struct AbilityInfo: Codable {
    let ability: Ability
}

struct Ability: Codable {
    let name: String
}


