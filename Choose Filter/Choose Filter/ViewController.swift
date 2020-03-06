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
    var image =  UIImage()

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
         self.dismiss(animated: true, completion: nil)
         image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
    imageView.image = image
    
     }
    
    @IBAction func takePhoto(_ sender: Any) {
    if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary){
    
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
        
                imagePicker.sourceType = .photoLibrary

                self.present(imagePicker, animated: true, completion: nil)
            }
    }
    @IBAction func sepia(_ sender: Any) {
      
            let inputImage = image
              let context = CIContext(options: nil)
              if let filter = CIFilter(name: "CISepiaTone") {
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
    
    
    @IBAction func Noir(_ sender: Any) {
  let inputImage = image
  let context = CIContext(options: nil)
  if let filter = CIFilter(name: "CIPhotoEffectNoir") {
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
   @IBAction func fade(_ sender: Any) {
   let inputImage = image
    let context = CIContext(options: nil)
    if let filter = CIFilter(name: "CIPhotoEffectFade") {
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
}

