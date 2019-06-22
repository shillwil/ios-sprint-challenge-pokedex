//
//  Pokemon.swift
//  Pokedex Sprint
//
//  Created by Alex Shillingford on 6/21/19.
//  Copyright © 2019 Alex Shillingford. All rights reserved.
//

import Foundation

struct Pokemon: Codable {
    let name, type: String
    let id: Int
    let abilityInfo: AbilityInfo
}

struct AbilityInfo: Codable {
    let abilities: [Ability]
}

struct Ability: Codable {
    let name: String
}


