//
//  Pokemon.swift
//  pokedex
//
//  Created by Mohamad Dbouk on 8/19/16.
//  Copyright © 2016 Mohamad Dbouk. All rights reserved.
//

import Foundation
class Pokemon {
    private var _name: String!
    private var _pokedexId: Int!
    private var _description: String!
    private var _defense: String!
    private var _height: String!
    private var _weight: String!
    private var _baseAttack: String!
    private var _nextEvolutionText: String!
    
    var name: String {
        return _name
    }
    
    var pokedexId: Int {
        return _pokedexId
    }
    
    var description: String {
        return _description
    }
    
    var defense: String {
        return _defense
    }
    
    var height: String {
        return _height
    }
    
    var weight: String {
        return _weight
    }
    
    var baseAttack: String {
        return _baseAttack
    }
    
    var nextEvolutionText: String {
        return _nextEvolutionText
    }
    
    init (name: String, pokedexId: Int) {
        _name = name
        _pokedexId = pokedexId
    }
}