//
//  ViewController.swift
//  kanyeInsultsAPI
//
//  Created by Ariana Kalili on 12/18/19.
//  Copyright © 2019 Ariana Kalili. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var kanyeLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func getQuote(_ sender: Any) {
        let url: URL = URL(string: "https://api.kanye.rest/")!
        let responseData: Data? = try? Data(contentsOf: url)
        if let responseData = responseData{
            let json: Any? = try? JSONSerialization.jsonObject(with: responseData, options:[])
            if let json = json {
                let dictionary: [String: String]? = json as? [String:String]
                if let dictionary = dictionary{
                    if let quote = dictionary["quote"]{
                        kanyeLabel.text = quote
                    }
                    else{
                    print(json)
              
                    }
                }
            }
        }
    }
}

