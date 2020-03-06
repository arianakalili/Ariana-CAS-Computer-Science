//
//  ViewController.swift
//  Cool Photo Taker
//
//  Created by Ariana Kalili on 3/4/20.
//  Copyright © 2020 Ariana Kalili. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    var photoList: [UIImage] = []
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var stackView: UIStackView!
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    let viewFrame = self.view.frame
    scrollView.frame = CGRect(x: 0.0, y: 0.0, width: viewFrame.width, height: viewFrame.height - 100)
    
    }

  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
         self.dismiss(animated: true, completion: nil)
         let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
    photoList.append(image)
    let newImageView = UIImageView(image: image)
    newImageView.contentMode = .scaleAspectFit
    
 
    let viewFrame: CGRect = view.frame
   
    let nestedView = UIStackView()
    nestedView.distribution = .fillEqually
    nestedView.addArrangedSubview(newImageView)
    stackView.addArrangedSubview(nestedView)
    
    stackView.addArrangedSubview(nestedView)
    let stackRect = CGRect(x: 0, y: 0, width: viewFrame.width, height: CGFloat(photoList.count) * viewFrame.width / 2)
    stackView.frame = stackRect
    scrollView.contentSize = stackRect.size
    
        
         }
    
    @IBAction func launchPhotoPicker(_ sender: Any) {
    if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary){
    
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.sourceType = .photoLibrary

                self.present(imagePicker, animated: true, completion: nil)
            }
    else{
        print("oops")
        }
    }
    
   
}

