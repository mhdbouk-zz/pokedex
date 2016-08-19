//
//  PokemonDetailVC.swift
//  pokedex
//
//  Created by Mohamad Dbouk on 8/19/16.
//  Copyright © 2016 Mohamad Dbouk. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {

    var pokemon: Pokemon!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var defenseLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var pokedexIdLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var baseAttackLabel: UILabel!
    @IBOutlet weak var prevEvoImage: UIImageView!
    @IBOutlet weak var evolutionLabel: UILabel!
    @IBOutlet weak var nextEvoImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = pokemon.name
        mainImage.image = UIImage(named: "\(pokemon.pokedexId)")
        pokemon.downloadPokemonDetails {
            self.updateUI()
        }
    }

    func updateUI(){
        self.defenseLabel.text = self.pokemon.defense
        self.baseAttackLabel.text = self.pokemon.baseAttack
        self.weightLabel.text = self.pokemon.weight
        self.heightLabel.text = self.pokemon.height
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButtonPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
