//
//  ViewController.swift
//  PhotoTaker
//
//  Created by Ariana Kalili on 2/20/20.
//  Copyright © 2020 Ariana Kalili. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    var takerController: UIImagePickerController!
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        switch AVCaptureDevice.authorizationStatus(for: .video){
            case .notDetermined:
                AVCaptureDevice.requestAccess(for: .video, completionHandler:{(_) in return })
            default:
                return
          }
    }

    @IBAction func takePhoto(_ sender: UIButton) {
        takeIt()
    }
    
    func takeIt(){
        takerController = UIImagePickerController()
        takerController.delegate = self
        takerController.sourceType = .camera
        present(takerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        takerController.dismiss(animated: true, completion: nil)
        imageView.image = info[.originalImage] as? UIImage
    }
    
}

