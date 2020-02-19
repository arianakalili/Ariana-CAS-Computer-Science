//
//  ViewController.swift
//  NumberGuesser
//
//  Created by Ariana Kalili on 2/11/20.
//  Copyright © 2020 Ariana Kalili. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Button1: NamedButton!
    @IBOutlet weak var Button2: NamedButton!
    @IBOutlet weak var Button3: NamedButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }
    var num: Int = 0
    @IBAction func easy(_ sender: Any) {
   num = 10
    }
    
    
    @IBAction func medium(_ sender: Any) {
    num = 25
    }
    
    @IBAction func Hard(_ sender: Any) {
    num = 50
    }
    /*  @IBAction func buttonPressed(_ sender: Any) {
        let message: String
        if let sender = sender as? NamedButton {
            message = "Hello, my name is \(sender.name)"
        }
        else {
            message = "Hello,  I don't know who I am."
        }
        
        let alert = UIAlertController(title: "Hi!", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as? ButtonViewController
        vc?.buttonNum = num
    }
}

