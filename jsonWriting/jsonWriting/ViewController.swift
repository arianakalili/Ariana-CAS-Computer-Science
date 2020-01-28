//
//  ViewController.swift
//  jsonWriting
//
//  Created by Ariana Kalili on 1/9/20.
//  Copyright © 2020 Ariana Kalili. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var dateInput: UITextField!
    @IBOutlet weak var enemyInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if let url = getFileURL(){
            let data = try? Data(contentsOf: url)
            if let data = data{
                let dict = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: String]
                nameInput.text = dict["name"]
                dateInput.text = dict["date"]
                enemyInput.text = dict["enemy"]
            }
        }
    }
    
    @IBAction func save(_ sender: Any) {
        let data: [String: String] = [
            "name" : nameInput.text ?? "NO!",
            "date" : dateInput.text ?? "NO!",
            "enemy" : enemyInput.text ?? "NO!"
        ]
        let url = getFileURL()
        if let jsonData = try? JSONSerialization.data(withJSONObject: data, options: []) {
            try! jsonData.write(to: url!)
        } else{
            print("Failed to Save :(")
        }
    }
    
    @IBAction func load(_ sender: Any) {
    }
   
    func getFileURL() -> URL? {
        let docDirectory = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        if docDirectory != nil {
            return docDirectory!.appendingPathComponent("saveFile.json")
        }
        return nil
    }
    
}

