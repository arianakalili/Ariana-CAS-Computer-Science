//
//  ViewController.swift
//  xrdsDictionary
//
//  Created by Ariana Kalili on 11/5/19.
//  Copyright © 2019 Ariana Kalili. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var vocabWordLabel: UILabel!
    @IBOutlet weak var vocabDefinitionLabel: UILabel!
    var vocabWord: String?
    var vocabDefinition: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vocabWordLabel.text = vocabWord
        vocabDefinitionLabel.text = vocabDefinition

        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
