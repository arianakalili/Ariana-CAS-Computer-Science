//
//  TableViewController.swift
//  Boat
//
//  Created by Ariana Kalili on 11/8/19.
//  Copyright © 2019 Ariana Kalili. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

  
    
    let boats:[Boat] = [
    
        Boat(n: "Kayak", dp: 0, c: "White", s: "Large"),
        Boat(n: "Monohaul", dp: 4, c: "Blue", s: "Medium"),
        Boat(n: "Yacht", dp: 320, c: "Pink", s: "Large"),
        Boat(n: "Pirate Ship", dp: 200, c: "Black", s: "Extra Large"),
        Boat(n: "Raft", dp: 1/2, c: "Brown", s: "Really Small"),
        Boat(n: "PHOENIX 2", dp: 4300000000, c: "Black and White", s: "Huge")
       
   
    ]
   
    var boat = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return boats.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        let title = boats[indexPath.row].name
        cell.textLabel!.text = title

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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let vc = segue.destination as! ViewController
        let indexPath = self.tableView.indexPathForSelectedRow!
        let boat = self.boats[indexPath.row]
        
        vc.boat = boat
    }

}
