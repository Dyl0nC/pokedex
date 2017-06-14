//
//  PokemonMovesVC.swift
//  Pokedex
//
//  Created by Dylan C on 6/14/17.
//  Copyright © 2017 Dylan Cunningham. All rights reserved.
//

import UIKit

class PokemonMovesVC: UIViewController {

    var pokemon: Pokemon!
    @IBOutlet weak var nameLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLbl.text = pokemon.name.capitalized
        
    }

    @IBAction func segmentedControl(_ sender: UISegmentedControl) {
        dismiss(animated: false, completion: nil)
    }
}
