//
//  Pokemon.swift
//  PocketPokedex
//
//  Created by Lenah Syed on 2/16/19.
//  Copyright © 2019 HackUCI. All rights reserved.
//

import Foundation
class Pokemon {
    var types: [String]
    var abilities: [String]
    var stats: Dictionary<String, Int>
    var moves: [String]
    
    init(types: [String], abilities: [String], stats: Dictionary<String, Int>, moves: [String]) {
        self.types = types
        self.abilities = abilities
        self.stats = stats
        self.moves = moves
    }
}
