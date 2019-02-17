//
//  PokedexViewController.swift
//  PocketPokedex
//
//  Created by Lenah Syed on 2/16/19.
//  Copyright © 2019 HackUCI. All rights reserved.
//

import UIKit

class PokedexViewController: UIViewController {
    
    var pokemon = Pokemon(types: [], abilities: [], stats: Dictionary<String, Int>(), moves: [])
    
    @IBOutlet weak var poketextfield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let user_input = poketextfield.text
        if segue.identifier == "stats" {
            let destination = segue.destination as! statstableview
            destination.user_input = user_input
            destination.selection = segue.identifier
        } else {
            let destination = segue.destination as! PokedexTableViewController
            destination.user_input = user_input
            destination.selection = segue.identifier
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
