//
//  ViewController.swift
//  calculator
//
//  Created by Ariana Kalili on 10/7/19.
//  Copyright © 2019 Ariana Kalili. All rights reserved.
//

import UIKit
enum modes {
    case not_set
    case addition
    case subtraction
    case multiplication
}
class ViewController: UIViewController {
  
 
    @IBOutlet weak var label: UILabel!
    var labelString: String = "0"
    var currentMode: modes = .not_set
    var savedNum: Int = 0
    var lastButtonWasMode:Bool =  false
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let existingNum = try? String(contentsOf:getFileURL())
        label.text = "\(existingNum ?? "0")"
        
        if existingNum != nil {
            let myNum = existingNum!
              try! savedNum = Int(myNum) ?? 0
        }
        
    }

    @IBAction func didPressNumber(_ sender: UIButton) {
        guard let stringValue:String? = sender.titleLabel?.text else{
            label.text = "Error"
            return
        }
        if lastButtonWasMode {
            lastButtonWasMode = false
            labelString = ""
        }
        labelString = labelString.appending(stringValue!)
        updateText()
    
    }
    
    @IBAction func didPressEquals(_ sender: Any) {
        guard let labelInt: Int = Int(labelString) else{
            return
        }
        if(currentMode == .not_set || lastButtonWasMode){
            return
        }
        if(currentMode == .addition || lastButtonWasMode){
            savedNum += labelInt
        }
        if(currentMode == .subtraction || lastButtonWasMode){
             savedNum -= labelInt
        }
        if(currentMode == .multiplication || lastButtonWasMode){
            savedNum *= labelInt
        }
        currentMode = .not_set
        labelString = "\(savedNum)"
        let num = "\(savedNum)"
        try? FileManager.default.removeItem(at: getFileURL())
        try! num.write(to: getFileURL(), atomically: true, encoding: .utf8)
        updateText()
        lastButtonWasMode = true
    }
    
    func getFileURL() -> URL {
        let documentURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        return documentURL.appendingPathComponent("savedNumber.txt")
    }
    
    @IBAction func didPressPlus(_ sender: Any) {
        labelString = ""
        changeMode(newMode : .addition)
    }
 
    @IBAction func didPressMinus(_ sender: Any) {
        labelString = ""
        changeMode(newMode : .subtraction)
    }
    
    @IBAction func didPressTimes(_ sender: Any) {
        labelString = ""
        changeMode(newMode : .multiplication)
    }
    
    @IBAction func didPressClear(_ sender: Any) {
        labelString = "0"
        currentMode = .not_set
        savedNum = 0
        lastButtonWasMode = false
        label.text = "0"
        try? FileManager.default.removeItem(at: getFileURL())
    }
    
    func updateText(){
        
        guard let labelInt:Int = Int(labelString)else{
            return
        }
        
        if(currentMode == .not_set){
            savedNum = labelInt
        }
        label.text = "\(labelInt)"
    }
    
    func changeMode(newMode : modes){
        if (savedNum == 0){
            return
        }
        currentMode = newMode
        lastButtonWasMode == true
    }
    
}

