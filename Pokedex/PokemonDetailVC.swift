//
//  PokemonDetailVC.swift
//  Pokedex
//
//  Created by Dylan C on 6/13/17.
//  Copyright © 2017 Dylan Cunningham. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var pokedexIDLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var defenseLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var attackLbl: UILabel!
    @IBOutlet weak var currentEvoImg: UIImageView!
    @IBOutlet weak var nextEvoImg: UIImageView!
    @IBOutlet weak var evoLbl: UILabel!
    
    var pokemon: Pokemon!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLbl.text = pokemon.name.capitalized
        
        let img = UIImage(named: "\(pokemon.pokedexID)")
        mainImg.image = img
        currentEvoImg.image = img
        pokedexIDLbl.text = "\(pokemon.pokedexID)"
        
        pokemon.downloadPokemonDetails {
            self.updateUI()
        }
    }

    func updateUI() {
        attackLbl.text = pokemon.attack
        defenseLbl.text = pokemon.defense
        heightLbl.text = pokemon.height
        weightLbl.text = pokemon.weight
        typeLbl.text = pokemon.type
        descriptionLbl.text  = pokemon.description
        if pokemon.nextEvolutionID == "" {
            evoLbl.text = "No Evolutions"
            nextEvoImg.isHidden = true
        } else {
            nextEvoImg.isHidden = false
            nextEvoImg.image = UIImage(named: pokemon.nextEvolutionID)
            evoLbl.text = "Next Evolution: \(pokemon.nextEvolutionName) - LVL \(pokemon.nextEvolutionLvl)"
        }
    }
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

    @IBOutlet weak var segControl: UISegmentedControl!
    
    @IBAction func segmentedController(_ sender: UISegmentedControl) {
        var poke: Pokemon!
        
        poke = self.pokemon
        
        performSegue(withIdentifier: "PokemonMovesVC", sender: poke)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PokemonMovesVC" {
            if let movesVC = segue.destination as? PokemonMovesVC {
                if let poke = sender as? Pokemon {
                    movesVC.pokemon = poke
                }
            }
        }
    }
}
