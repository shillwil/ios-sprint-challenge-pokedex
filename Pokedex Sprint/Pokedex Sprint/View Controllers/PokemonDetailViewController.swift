//
//  PokemonDetailViewController.swift
//  Pokedex Sprint
//
//  Created by Alex Shillingford on 6/21/19.
//  Copyright © 2019 Alex Shillingford. All rights reserved.
//

import UIKit

class PokemonDetailViewController: UIViewController {
    
    // MARK: - IBOutlets and Properties
    var pokemonController: PokemonController? {
        didSet {
            updateViews()
        }
    }
    var index: Int?
    
    @IBOutlet weak var pokemonNameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var typesLabel: UILabel!
    @IBOutlet weak var abilitiesLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var searchBar: UISearchBar!

    // MARK: - IBActions, Methods and Functions
    override func viewDidLoad() {
        super.viewDidLoad()

        searchBar.delegate = self
    }
    
    
    
    @IBAction func savePokemonButtonTapped(_ sender: UIButton) {
        pokemonController?.pokemonList.append(pokemonController!.pokemon!)
        
    }
    
    func updateViews() {
        guard let pokemonController = self.pokemonController else { return }
        guard let pokemon = pokemonController.pokemon else { return }
        var abilitiesList = ""
//        guard let index = index else { return }
        idLabel.text = String(pokemon.id)
        pokemonNameLabel.text = pokemon.name
//        typesLabel.text = pokemon.type
        for index in pokemon.abilities {
            if abilitiesList.isEmpty {
                abilitiesList = index.ability.name
            } else if !abilitiesList.isEmpty {
                abilitiesList = abilitiesList + ", " + index.ability.name
                abilitiesLabel.text = abilitiesList
            }
        }
    }
    

}

extension PokemonDetailViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchingFor = searchBar.text else { return }
        guard let pokemonController = self.pokemonController else { return }
        pokemonController.searchPokemon(pokemonName: searchingFor) { (pokemon, error) in
            if let error = error {
                print("Error searching pokemon: \(error)")
                return
            }
            
            DispatchQueue.main.async {
                self.updateViews()
            }
        }
    }
}
