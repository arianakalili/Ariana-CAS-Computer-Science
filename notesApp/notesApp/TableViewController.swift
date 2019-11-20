//
//  TableViewController.swift
//  notesApp
//
//  Created by Ariana Kalili on 11/14/19.
//  Copyright © 2019 Ariana Kalili. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var notes:[Note] = [Note]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let note1 = Note()
        note1.note = "This is my first note"
        notes.append(note1)
        
        let note2 = Note()
        note2.note = "This is my second note"
        notes.append(note2)
        
        let note3 = Note()
        note3.note = "This is my third note"
        notes.append(note3)
        

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
       
        return notes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell...
        
        
        let title = notes[indexPath.row].note
        cell.textLabel!.text = title
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool){
        self.tableView.reloadData()
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

  
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        let vc = segue.destination as! ViewController
     
        if let indexPath = self.tableView.indexPathForSelectedRow {
            let note = self.notes[indexPath.row]
            vc.note = note
        }
        
        else {
            let note = Note()
            notes.append(note)
            vc.note=note
            print(notes.count)
        }
    }
    

}
