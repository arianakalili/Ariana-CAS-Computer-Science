//
//  ViewController.swift
//  appRememberer
//
//  Created by Ariana Kalili on 1/7/20.
//  Copyright © 2020 Ariana Kalili. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var greetingLabel: UILabel!
    @IBOutlet weak var nameEntry: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let existingName = try? String(contentsOf:getFileURL())
        greetingLabel.text = "Hello, \(existingName ?? "Stranger")"
    }

    func getFileURL() -> URL {
      let documentURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        return documentURL.appendingPathComponent("userName.txt")
    }
    
    @IBAction func rememberName(_ sender: Any) {
        let name = nameEntry.text!
        try! name.write(to: getFileURL(), atomically: true, encoding: .utf8)
        greetingLabel.text = "Hello, \(name)"
    }
    
    @IBAction func forgetName(_ sender: Any) {
        try? FileManager.default.removeItem(at: getFileURL())
        greetingLabel.text = "New phone who dis?"
    }
    
}

