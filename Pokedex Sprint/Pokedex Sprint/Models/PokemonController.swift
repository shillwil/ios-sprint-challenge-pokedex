//
//  PokemonController.swift
//  Pokedex Sprint
//
//  Created by Alex Shillingford on 6/21/19.
//  Copyright © 2019 Alex Shillingford. All rights reserved.
//

import Foundation
import UIKit

enum HTTPMethod: String {
    case get = "GET"
    case put = "PUT"
    case post = "POST"
    case delete = "DELETE"
}

enum NetworkError: Error {
    case noAuth
    case badAuth
    case otherError
    case badData
    case noDecode
}

class PokemonController {
    private let baseURL = URL(string: "https://pokeapi.co/api/v2/pokemon")!
    private var imageC: UIImage?
    var pokemon: Pokemon?
    var pokemonList: [Pokemon] = []
    
    func searchPokemon(pokemonName: String, completion: @escaping (Result<Pokemon, NetworkError>) -> Void) {
        
    }
    
}
