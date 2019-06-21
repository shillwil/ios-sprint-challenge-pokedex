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
    var pokemonController: PokemonController! {
        didSet {
            updateViews()
        }
    }
    guard let pokemon = pokemonController.pokemon else { return }
    
    @IBOutlet weak var pokemonNameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var typesLabel: UILabel!
    @IBOutlet weak var abilitiesLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!

    // MARK: - IBActions, Methods and Functions
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    
    
    @IBAction func savePokemonButtonTapped(_ sender: UIButton) {
        
    }
    
    func updateViews() {
        idLabel.text = String(pokemon.id)
        pokemonNameLabel.text = pokemon.name
        typesLabel.text = pokemon.type
        abilitiesLabel.text = pokemon.abilities
    }
    

}
