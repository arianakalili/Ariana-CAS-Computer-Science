//
//  ButtonViewController.swift
//  NumberGuesser
//
//  Created by Ariana Kalili on 2/12/20.
//  Copyright © 2020 Ariana Kalili. All rights reserved.
//

import UIKit

class ButtonViewController: UIViewController {
    
    var buttonNum:Int?
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var stackView: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let randomInt = Int.random(in: 1...50)
        (1...buttonNum!).map({(i) -> UIButton in
            let newButton = UIButton()
            newButton.setTitle("Button \(i)", for: .normal)
            newButton.setTitleColor(UIColor(displayP3Red: 1, green: 0, blue: 0, alpha: 1), for: .normal)
            newButton.frame = CGRect(x: 0, y: 0, width: 200, height: 30)
            stackView.addArrangedSubview(newButton)
        
            if i < randomInt {
                showAlert(title: "Too Low")
            }
            
            if i > randomInt {
                showAlert(title: "Too High")
                
            }
            
            if i == randomInt {
                showAlert(title: "Yay, you guessed the right number!")
                          
            }
            
            return newButton
      
        })
             
        stackView.frame = CGRect(x: 0, y: 0, width: 200, height: 1500)
        
        scrollView.contentSize = CGSize(width: 200, height: 1500)
    

    }
  
    @objc func showAlert(title: String){
          let alert = UIAlertController(title: " ", message: title, preferredStyle: .alert)
           alert.addAction(UIAlertAction (title: "OK", style: .default, handler: { (_) in return}))
           self.present(alert, animated: true, completion: {} )
           
       }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
