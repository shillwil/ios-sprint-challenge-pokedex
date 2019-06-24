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
    
    func searchPokemon(pokemonName: String, completion: @escaping (Pokemon?, Error?) -> Void) {
        let lowercasedPokemonName = pokemonName.lowercased()
        let requestURL = baseURL.appendingPathComponent(lowercasedPokemonName)
        var request = URLRequest(url: requestURL)
        request.httpMethod = HTTPMethod.get.rawValue
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            if let error = error {
                print("Error with dataTask: \(error)")
                completion(nil, error)
                return
            }
            
            guard let data = data else {
                completion(nil, nil)
                return
            }
            
            do {
                let pokemonData = try JSONDecoder().decode(Pokemon.self, from: data)
                self.pokemon = pokemonData
                completion(pokemonData, nil)
            } catch {
                print("Error decoding pokemon: \(error)")
                completion(nil, nil)
                return
            }
        }.resume()
    }
}
