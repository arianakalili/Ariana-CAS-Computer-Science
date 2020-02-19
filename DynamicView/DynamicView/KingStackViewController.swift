//
//  KingStackViewController.swift
//  DynamicView
//
//  Created by Ariana Kalili on 2/6/20.
//  Copyright © 2020 Ariana Kalili. All rights reserved.
//

import UIKit

class KingStackViewController: UIViewController {
    
    var labelCount = 5
    
    @IBOutlet weak var lordStackView: UIStackView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let labels = (1...labelCount).map({ (x) in UILabel() })
        for label in labels {
            label.text = "Hi"
            lordStackView.addArrangedSubview(label)
        }

        // Do any additional setup after loading the view.
    }
    

    

}
