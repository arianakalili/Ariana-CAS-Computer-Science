//
//  ViewController.swift
//  Choose Filter
//
//  Created by Ariana Kalili on 3/4/20.
//  Copyright © 2020 Ariana Kalili. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    var filterType = "a thing"
    

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
         self.dismiss(animated: true, completion: nil)
         let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
       //  imageView.image = image
         let inputImage = image
         let context = CIContext(options: nil)
         if let filter = CIFilter(name: filterType) {
             let beginImage = CIImage(image: inputImage)
             filter.setDefaults()
             filter.setValue(beginImage, forKey: kCIInputImageKey)
             if let output = filter.outputImage{
                 if let cgimg = context.createCGImage(output,from: output.extent){
                     let processedImage = UIImage(cgImage: cgimg)
                     imageView.image = processedImage
                 }
             }
         }
    
     }
    @IBAction func sepia(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary){
            filterType = "CISepiaTone"
    
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                //  for phone
                //  imagePicker.sourceType = .camera
                //  for simulator
                imagePicker.sourceType = .photoLibrary

                self.present(imagePicker, animated: true, completion: nil)
            }
        
    }
    
    
    @IBAction func Noir(_ sender: Any) {
  if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary){
    filterType = "CIPhotoEffectNoir"
      let imagePicker = UIImagePickerController()
      imagePicker.delegate = self
      imagePicker.sourceType = .photoLibrary

      self.present(imagePicker, animated: true, completion: nil)
  }
    }
    
    
   @IBAction func fade(_ sender: Any) {
    if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary){
        filterType = "CIPhotoEffectFade"
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.sourceType = .photoLibrary

                self.present(imagePicker, animated: true, completion: nil)
            }
    }
    
}

