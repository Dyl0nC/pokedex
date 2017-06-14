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
    @IBOutlet weak var moveOne: UILabel!
    @IBOutlet weak var moveTwo: UILabel!
    @IBOutlet weak var moveThree: UILabel!
    @IBOutlet weak var moveFour: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLbl.text = pokemon.name.capitalized
        
        moveOne.text = pokemon.moveOne
        moveTwo.text = pokemon.moveTwo
        moveThree.text = pokemon.moveThree
        moveFour.text = pokemon.moveFour
    }

    @IBAction func segmentedControl(_ sender: UISegmentedControl) {
        dismiss(animated: false, completion: nil)
    }
}
