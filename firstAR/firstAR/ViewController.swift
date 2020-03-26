//
//  ViewController.swift
//  firstAR
//
//  Created by Ariana Kalili on 3/9/20.
//  Copyright © 2020 Ariana Kalili. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet weak var ARSNView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ARSNView.delegate = self
        let scene = SCNScene(named: "SceneKit Asset Catalog.scnassets/blank.scn")!
        ARSNView.scene = scene
    }

    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           let configuration = ARImageTrackingConfiguration()
           setTrackingImages("AR Resource Group", for: configuration)
           ARSNView.session.run(configuration)
       }
       
       func setTrackingImages(_ groupName: String, for configuration: ARImageTrackingConfiguration) {
           guard let trackingImages = ARReferenceImage.referenceImages(inGroupNamed: groupName, bundle: .main) else {
               print("No images")
               return
           }
           configuration.trackingImages = trackingImages
           configuration.maximumNumberOfTrackedImages = 3
       }
       
       override func viewWillDisappear(_ animated: Bool) {
           super.viewWillDisappear(animated)
           ARSNView.session.pause()
       }
       
       func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
           guard let imageAnchor = anchor as? ARImageAnchor else {
               print("Not an image")
               return nil
           }
           let node = SCNNode()
           overlayRedaction(on: node, fromAnchor: imageAnchor)
           return node
       }
       
       func overlayRedaction(on node: SCNNode, fromAnchor anchor: ARImageAnchor) {
           let plane = SCNPlane(width: anchor.referenceImage.physicalSize.width, height: anchor.referenceImage.physicalSize.height)
           plane.firstMaterial?.diffuse.contents = UIColor(white: 0.0, alpha: 1.0)
           let planeNode = SCNNode(geometry: plane)
           planeNode.eulerAngles.x = -.pi / 2
           node.addChildNode(planeNode)
       }

}

