//
//  ViewController.swift
//  countingApp
//
//  Created by Ariana Kalili on 9/19/19.
//  Copyright © 2019 Ariana Kalili. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var countingLabel: UILabel!
    @IBOutlet weak var countingButton: UIButton!
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

   
    @IBAction func buttonPressed(_ sender: Any) {
        
        counter += 1
        countingLabel.text = "Button Pressed \(counter) Times"
    }
    
    
    

}

