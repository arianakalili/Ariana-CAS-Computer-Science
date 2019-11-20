//
//  ViewController.swift
//  notesApp
//
//  Created by Ariana Kalili on 11/14/19.
//  Copyright © 2019 Ariana Kalili. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
    var note : Note?
    @IBOutlet weak var noteTextField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        noteTextField.text = note?.note

        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        note?.note = noteTextField.text
        
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
