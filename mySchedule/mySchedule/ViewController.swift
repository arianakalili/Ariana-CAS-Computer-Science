//
//  ViewController.swift
//  mySchedule
//
//  Created by Ariana Kalili on 10/23/19.
//  Copyright © 2019 Ariana Kalili. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    let dayType:[String]=["A", "B", "C"]
    let weekDay:[String]=["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]
    let scheduleType:[String]=["Regular", "Double Block", "Assembly"]
    let mySchedule:[String:String]=[
        "A":"Latin",
        "B":"Computer Science",
        "C":"Multi-Variable Calc",
        "D":"English",
        "E":"History",
        "F":"Design and Engineering",
        "M/W 5/6":"Ceramics",
        "T":"Life Skills",
        "Th/F":"Free"
    ]
    
    let afternoon:[String:String]=[
        "Monday":"Ceramics",
        "Tuesday":"Life Skills",
        "Wednesday":" Ceramics",
        "Thursday":"Free Period",
        "Friday":"Free Period"
    ]
    
    let regular:[String] = [
        "Period 1 8:15-9:10",
        "Period 2 9:15-10:10",
        "Snack 10:10-10:25",
        "Period 3 10:30-11:25",
        "Period 4 11:30-12:25",
        "Lunch 12:25-1:00",
        "Period 5/6 1:05-3:00"
    ]
   
    let doubleBlock:[String] = [
        "Block 1 8:15-9:50",
        "Snack 9:50-10:05",
        "Advisory 10:05-11:05",
        "Block 2 11:10-12:45",
        "Lunch 12:45-1:20",
        "Block 3 1:25-3:00"
    ]
   
    let assembly:[String] = [
        "Period 1 8:15-9:05",
        "Period 2 9:10-10:00",
        "Assembly 10:05-10:45",
        "Snack 10:45-10:55",
        "Period 3 11:00-11:50",
        "Period 4 11:55-12:45",
        "Lunch 12:45-1:10",
        "Period 5/6 1:15-3:00"
    ]
    
    @IBOutlet weak var schedulePicker: UIPickerView!
    @IBOutlet weak var scheduleLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return dayType.count
        }
        else if component == 1 {
            return weekDay.count
        }
        else {
            return scheduleType.count
        }
    }
  
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return dayType[row]
        }
        else if component == 1 {
            return weekDay[row]
        }
        else {
            return scheduleType[row]
        }
    }

    @IBAction func findSchedule(_ sender: Any) {
        let dayTypeRow = schedulePicker.selectedRow(inComponent: 0)
        let ACBDay = dayType[dayTypeRow]
       
        
        let regPeriodRotation: [String:[String]] = [
            "A" : ["A", "B", "D", "E",],
            "C" : ["C", "A", "F", "D",],
            "B" : ["B", "C", "E", "F",]
        ]
        let dblPeriodRotation: [String:[String]] = [
            "A" : ["A", "D"],
            "C" : ["C", "F"],
            "B" : ["B", "E"]
        ]
        let assemPeriodRotation: [String:[String]] = [
            "A" : ["A", "B", "D", "E",],
            "C" : ["C", "A", "F", "D",],
            "B" : ["B", "C", "E", "F",]
        ]
       
        if schedulePicker.selectedRow(inComponent: 2) == 0 {
        
        let mySched = getScheduleForRegDay(periods: regPeriodRotation[ACBDay]!, mySchedule: mySchedule)
        scheduleLabel.text=mySched
        }
        
        if schedulePicker.selectedRow(inComponent: 2) == 1 {
            
            let mySched = getScheduleForDblDay(periods: dblPeriodRotation[ACBDay]!, mySchedule: mySchedule)
            scheduleLabel.text=mySched
        }
        
        if schedulePicker.selectedRow(inComponent: 2) == 2 {
            
            let mySched = getScheduleForAssemDay(periods: assemPeriodRotation[ACBDay]!, mySchedule: mySchedule)
            scheduleLabel.text=mySched
        }
        
        }
    func getScheduleForRegDay(periods:[String], mySchedule:[String:String]) -> String {
        var output = ""
        for period in periods{
         
                output += "\(period) - "
                output += mySchedule[period] ?? "free period"
                output += "\n"
              
        }
        
        let weekDayRow = schedulePicker.selectedRow(inComponent: 1)
        let afternoonPeriod = weekDay[weekDayRow]
        let fifthAndSixth = afternoon[afternoonPeriod]!
        output += "Period 5/6 1:05-3:00 : \(fifthAndSixth)"
        return output 
    }
    
    func getScheduleForDblDay(periods:[String], mySchedule:[String:String]) -> String {
        var output = ""
        for period in periods{
         
                output += "\(period) - "
                output += mySchedule[period] ?? "free period"
                output += "\n"
        }
        
        let weekDayRow = schedulePicker.selectedRow(inComponent: 1)
        let afternoonPeriod = weekDay[weekDayRow]
        let fifthAndSixth = afternoon[afternoonPeriod]!
        output += "Block 3 1:25-3:00 : \(fifthAndSixth)"
        return output
    }
    func getScheduleForAssemDay(periods:[String], mySchedule:[String:String]) -> String {
        var output = ""
        for period in periods{
            
                output += "\(period) - "
                output += mySchedule[period] ?? "free period"
                output += "\n"
        
        }
        
        let weekDayRow = schedulePicker.selectedRow(inComponent: 1)
        let afternoonPeriod = weekDay[weekDayRow]
        let fifthAndSixth = afternoon[afternoonPeriod]!
        output += "Period 5/6 1:15-3:00 : \(fifthAndSixth)"
        return output
    
    }
    
    
}

