//
//  Pokemon.swift
//  pokedex
//
//  Created by Mohamad Dbouk on 8/19/16.
//  Copyright © 2016 Mohamad Dbouk. All rights reserved.
//

import Foundation
import Alamofire

class Pokemon {
    private var _name: String!
    private var _pokedexId: Int!
    private var _description: String!
    private var _type: String!
    private var _defense: String!
    private var _height: String!
    private var _weight: String!
    private var _baseAttack: String!
    private var _nextEvolutionText: String!
    private var _pokemonUrl: String!
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
    
    var pokemonUrl: String {
        return _pokemonUrl
    }
    
    var type: String {
        return _type
    }
    
    init (name: String, pokedexId: Int) {
        _name = name
        _pokedexId = pokedexId
        _pokemonUrl = "\(URL_BASE)\(URL_POKEMON)\(_pokedexId)/"
        
        _type = ""
    }
    
    func downloadPokemonDetails(completed: DownloadComplete) {
        Alamofire.request(.GET, _pokemonUrl).responseJSON { response in
            let result = response.result
            if let dic = result.value as? Dictionary<String, AnyObject> {
                if let weight = dic["weight"] as? String {
                    self._weight = weight
                }
                
                if let height = dic["height"] as? String {
                    self._height = height
                }
                
                if let attack = dic["attack"] as? Int {
                    self._baseAttack = "\(attack)"
                }
                
                if let defense = dic["defense"] as? Int {
                    self._defense = "\(defense)"
                }
                
                if let types = dic["types"] as? [Dictionary<String, String>] where types.count > 0 {
                    if let name = types[0]["name"] {
                        self._type = name.capitalizedString
                    }
                    
                    if types.count > 1 {
                        for x in 1 ..< types.count {
                            if let name = types[x]["name"] {
                                self._type! += "/\(name.capitalizedString)"
                            }
                        }
                    } else {
                        self._type = ""
                    }
                }
                if let descriptions = dic["descriptions"] as? [Dictionary<String,String>] where descriptions.count > 0 {
                    if let url = descriptions[0]["resource_uri"] {
                        Alamofire.request(.GET, url).responseJSON { descResponse in
                            let descResult = descResponse.result
                            if let descDict = descResult.value as? Dictionary<String, AnyObject> {
                                if let description = descDict["description"] as? String {
                                    self._description = description
                                    
                                    print(self._description)
                                }
                            }
                            
                            completed()
                        }
                    }
                } else {
                    self._description = ""
                }
                
            }
        }
    }
}