//
//  ViewController.swift
//  birthYearCalculator
//
//  Created by Ariana Kalili on 9/23/19.
//  Copyright © 2019 Ariana Kalili. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ageBox: UITextField!
    @IBOutlet weak var yesNoSwitch: UISegmentedControl!
    @IBOutlet weak var yearButton: UIButton!
    @IBOutlet weak var yearLabel: UILabel!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

   
    
    
    
    @IBAction func findYear(_ sender: Any) {
      
        
        if var ageInt = Int(ageBox.text!){
            
            switch yesNoSwitch.selectedSegmentIndex {
           
            case 0:
                var year = 2019
                var birthYear = Int(year) - ageInt
               
                if birthYear >= 2019 {
                    yearLabel.text = "Stop lying to me!"
                }
                
                else if birthYear > 0 {
                    yearLabel.text = "You were born in \(birthYear) CE"
                }
                else if birthYear <= 0 {
                yearLabel.text = "You were born in \((birthYear - 1) * -1) BCE"
                }
            
            case 1:
                var year = 2018
                var birthYear = Int(year) - ageInt
                
                if birthYear >= 2019 {
                    yearLabel.text = "Stop lying to me!"
                }
                
                else if birthYear > 0 {
                    yearLabel.text = "You were born in \(birthYear) CE"
                }
                else if birthYear <= 0 {
                    yearLabel.text = "You were born in \((birthYear - 1) * -1) BCE"
                }
         
            default:
                var year = 2019
                var birthYear = Int(year) - ageInt
              
                if birthYear >= 2019 {
                    yearLabel.text = "Stop lying to me!"
                }
                
                if birthYear > 0 {
                    yearLabel.text = "You were born in \(birthYear) CE"
                }
                if birthYear <= 0 {
                    yearLabel.text = "You were born in \((birthYear - 1) * -1) BCE"
                }
                
            }

        }
        else {
            yearLabel.text = "Something went wrong, make sure your age is in numerical form."
        }
        
        
    }
}
    


