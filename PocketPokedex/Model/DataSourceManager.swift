//
//  DataSourceManager.swift
//  PocketPokedex
//
//  Created by Lenah Syed on 2/16/19.
//  Copyright © 2019 HackUCI. All rights reserved.
//

import Foundation

class DataSourceManager {

    
    static func get_pokemon_data(pokemon: String, completion: @escaping (Pokemon) -> Void) {
        if let url = URL(string: "https://pokeapi.co/api/v2/pokemon/\(pokemon)/") {
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
            // This will run when the network request returns
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                var type_list: [String] = []
                var stats_dict = Dictionary<String, Int>()
                var moves_list: [String] = []
                var abilities_list: [String] = []
                if let dataDictionary: Dictionary = try! JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                    if let abilities_result = dataDictionary["abilities"] as?[Dictionary<String, Any>] {
                        for element in abilities_result {
                            if let ability = element["ability"] as? Dictionary<String, String> {
                                abilities_list.append(ability["name"]!)
                            }
                        }
                    }
                    if let moves_results = dataDictionary["moves"] as?[Dictionary<String, Any>] {
                        for element in moves_results {
                            if let move = element["move"] as? Dictionary<String, String> {
                                moves_list.append(move["name"]!)
                            }
                        }
                    }
                    if let stats_results = dataDictionary["stats"] as? [Dictionary<String, Any>] {
                        for element in stats_results {
                            let base_stat = element["base_stat"] as? Int
                            if let stat = element["stat"] as? Dictionary<String, String> {
                                stats_dict[stat["name"]!] = base_stat
                            }
                        }
                    }
                    if let type_results = dataDictionary["types"] as? [Dictionary<String, Any>] {
                        for element in type_results {
                            if let type = element["type"] as? Dictionary<String, String> {
                                type_list.append(type["name"]!)
                            }
                        }
                    }
                }
                
                
                
                let p = Pokemon(types: type_list, abilities: abilities_list, stats: stats_dict, moves: moves_list)
                return completion(p)
    
    
                }
            }
            task.resume()
        
        }
    }

}
