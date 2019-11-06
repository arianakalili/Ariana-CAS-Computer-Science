//
//  ViewController.swift
//  pizzaPicker
//
//  Created by Ariana Kalili on 10/16/19.
//  Copyright © 2019 Ariana Kalili. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
   
  
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return pizzaFlavors.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
       return pizzaFlavors[row]
    }
    @IBOutlet weak var pizzaPicker: UIPickerView!
    @IBOutlet weak var pizzaLabel: UILabel!
    
    let pizzaFlavors = ["Hawaiian", "BBQ Chicken", "Cheese" , "Vegetarian" , "Margherita"]
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func order(_ sender: Any) {
        let row = pizzaPicker.selectedRow(inComponent:0)
        pizzaLabel.text = "You ordered a "+pizzaFlavors[row]+" pizza."
   
    }
    
}

