//
//  statstableview.swift
//  PocketPokedex
//
//  Created by Lenah Syed on 2/16/19.
//  Copyright © 2019 HackUCI. All rights reserved.
//

import UIKit

class statstableview: UITableViewController {
    var isValid: Bool!
    var data_dict = Dictionary<String, Int>()
    var user_input: String!
    var pokemon: Pokemon?
    var selection: String!
    var validPokemon = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DataSourceManager.get_pokemon_data(pokemon: user_input!) { (p, isValid) in
            if isValid == false {
                self.validPokemon = false
                
            } else  {
                self.data_dict = p.stats
                self.tableView.reloadData()
            }
            
            if isValid == false {
                let alert = UIAlertController(title: "Alert", message: "The pokemon you entered is not a valid pokemon or doesn't exist!", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return data_dict.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // create alert
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.value2, reuseIdentifier: "reuseidentifier")
        
        if validPokemon == false {
            let alert = UIAlertController(title: "Alert", message: "The pokemon you entered is not a valid pokemon or doesn't exist!", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else {
            let name_array = Array(data_dict.keys)
            let base_array_int = Array(data_dict.values)
            
            var base_array_string = [String]()
            for base in base_array_int {
                base_array_string.append(String(base))
            }
            
            cell.textLabel?.text = name_array[indexPath.row]
            cell.detailTextLabel?.text = base_array_string[indexPath.row]
        }


        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
