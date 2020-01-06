//
//  ViewController.swift
//  swapiFetchingApp
//
//  Created by Ariana Kalili on 12/18/19.
//  Copyright © 2019 Ariana Kalili. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var releaseLabel: UILabel!
    @IBOutlet weak var placement: UILabel!
    
    @IBAction func firstMovie(_ sender: Any) {
        let url: URL = URL(string: "https://swapi.co/api/films/1/")!
        let responseData: Data? = try? Data(contentsOf: url)
        if let responseData = responseData{
            let json: Any? = try? JSONSerialization.jsonObject(with: responseData, options:[])
            if let json = json {
                let dictionary: [String: Any]? = json as? [String: Any]
                if let dictionary = dictionary{
                    let director: String? = dictionary["director"] as? String
                    let releaseDate: String? = dictionary["release_date"] as? String
                    let episodeID: Int? = dictionary["episode_id"] as? Int
                    if (director != nil && releaseDate != nil && episodeID != nil ){
                        directorLabel.text = "Director: \(director!)"
                        releaseLabel.text = "Release Date: \(releaseDate!)"
                        placement.text = "Chronological Placement: \(episodeID!)"
                    }
                    else {directorLabel.text = "oops3"}
                    
                }
                else {directorLabel.text = "oops2"}
            }
            else {directorLabel.text = "oops1"}
        }
    }
    @IBAction func secondMovie(_ sender: Any) {
        let url: URL = URL(string: "https://swapi.co/api/films/2/")!
        let responseData: Data? = try? Data(contentsOf: url)
        if let responseData = responseData{
            let json: Any? = try? JSONSerialization.jsonObject(with: responseData, options:[])
            if let json = json {
                let dictionary: [String: Any]? = json as? [String: Any]
                if let dictionary = dictionary{
                    let director: String? = dictionary["director"] as? String
                    let releaseDate: String? = dictionary["release_date"] as? String
                    let episodeID: Int? = dictionary["episode_id"] as? Int
                    if (director != nil && releaseDate != nil && episodeID != nil ){
                        directorLabel.text = "Director: \(director!)"
                        releaseLabel.text = "Release Date: \(releaseDate!)"
                        placement.text = "Chronological Placement: \(episodeID!)"
                    }
                    else {directorLabel.text = "oops3"}
                    
                }
                else {directorLabel.text = "oops2"}
            }
            else {directorLabel.text = "oops1"}
        }
    }
    
    @IBAction func prequal(_ sender: Any) {
        let url: URL = URL(string: "https://swapi.co/api/films/4/")!
        let responseData: Data? = try? Data(contentsOf: url)
        if let responseData = responseData{
            let json: Any? = try? JSONSerialization.jsonObject(with: responseData, options:[])
            if let json = json {
                let dictionary: [String: Any]? = json as? [String: Any]
                if let dictionary = dictionary{
                    let director: String? = dictionary["director"] as? String
                    let releaseDate: String? = dictionary["release_date"] as? String
                    let episodeID: Int? = dictionary["episode_id"] as? Int
                    if (director != nil && releaseDate != nil && episodeID != nil ){
                        directorLabel.text = "Director: \(director!)"
                        releaseLabel.text = "Release Date: \(releaseDate!)"
                        placement.text = "Chronological Placement: \(episodeID!)"
                    }
                    else {directorLabel.text = "oops3"}
                    
                }
                else {directorLabel.text = "oops2"}
            }
            else {directorLabel.text = "oops1"}
        }
    }
    
}




