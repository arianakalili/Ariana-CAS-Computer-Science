//
//  ViewController.swift
//  HardCoding
//
//  Created by Ariana Kalili on 2/3/20.
//  Copyright © 2020 Ariana Kalili. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dvc = segue.destination as! DetailsViewController
        let button = sender as! UIButton
        if button.titleLabel!.text == "Mario" {
            dvc.characterClicked = [
                "name": "Mario",
                "description": "a plumber",
                "alignment": "good"
            ]
        }
        if button.titleLabel!.text == "Bowser" {
                dvc.characterClicked = [
                    "name": "Bowser",
                    "description": "koopa",
                    "alignment": "bad"
            ]
        }
        if button.titleLabel!.text == "Peach" {
                dvc.characterClicked = [
                    "name": "Peach",
                    "description": "a princess",
                    "alignment": "good"
            ]
            
        }
    }
}

