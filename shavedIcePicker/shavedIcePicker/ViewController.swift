//
//  ViewController.swift
//  shavedIcePicker
//
//  Created by Ariana Kalili on 10/21/19.
//  Copyright © 2019 Ariana Kalili. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component:Int) -> Int {
        return iceFlavors.count
        
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return iceFlavors[row]
    }
  
    @IBOutlet weak var icePicker: UIPickerView!
    @IBOutlet weak var orderLabel: UILabel!
  
    let iceFlavors = ["Pina Colada", "Blue Rasberry", "Cherry", "Lemon Lime", "Tiger's Blood", "Bubble Gum"]
    let prices = ["$5.99", "$3.99", "$3.99", "$4.99", "$5.99", "$9.99"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func orderButton(_ sender: Any) {
        let row = icePicker.selectedRow (inComponent:0)
        orderLabel.text = "Your Ordered \(iceFlavors[row]). That will be \(prices[row])."
    }
    
}

