//
//  ViewController.swift
//  JSON App
//
//  Created by Ariana Kalili on 12/5/19.
//  Copyright © 2019 Ariana Kalili. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myLabel2: UILabel!
    @IBOutlet weak var myLabel3: UILabel!
    
    var jsonFileData: Data?
    var jsonFileString: String?
    
    // TODO: Come up with a better UI than just a single boring label.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let fileUrl = Bundle.main.url(forResource: "data", withExtension: "json") {
            jsonFileData = try? Data(contentsOf: fileUrl)
            jsonFileString = try? String(contentsOf: fileUrl)
            
            let json = try? JSONSerialization.jsonObject(with: jsonFileData!, options:[])
            let dictionary = json as! [String: Any]
            let name: String = dictionary["name"] as! String
            let colleges: [String] = dictionary["colleges"] as! [String]
            let message: String = dictionary["message"] as! String
            
            myLabel.text = "Hi my name is \(name)!"
            myLabel2.text = message
            myLabel3.text = "I've applied to \(colleges.joined(separator: ", ")) so far."
        }
        // This just puts the file contents (unparsed) into the label.
        /*  if let string = jsonFileString {
         myLabel.text = string
         }
         
         if let data = jsonFileData {
         // TODO: Parse the JSON data and display it in the app.
         }
         */
    }
    
}


