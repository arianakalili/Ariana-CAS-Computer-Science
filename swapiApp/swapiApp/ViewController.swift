//
//  ViewController.swift
//  swapiApp
//
//  Created by Ariana Kalili on 12/11/19.
//  Copyright © 2019 Ariana Kalili. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func pressOne(_ sender: Any) {
        let url: URL = URL(string: "https://swapi.co/api/people/1/")!
        let responseData: Data? = try? Data(contentsOf: url)
        if let responseData = responseData{
            let json: Any? = try? JSONSerialization.jsonObject(with: responseData, options:[])
            if let json = json {
                let dictionary: [String: Any]? = json as? [String: Any]
                if let dictionary = dictionary{
                    let name: String? = dictionary["name"] as? String
                    if let name = name{
                        nameLabel.text = name
                    }
                }
            }
        }
    }
}


