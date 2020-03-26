//
//  ViewController.swift
//  MapMarker
//
//  Created by Riley John Gibbs on 3/22/20.
//  Copyright © 2020 Riley John Gibbs. All rights reserved.
//

import MapKit
import UIKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var crossroadsLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
    let CROSSROADS_LAT = 34.0240892
    let CROSSROADS_LONG = -118.4747321
    
    let STONEHENGE_LAT = 51.1789
    let STONEHENGE_LONG = -1.8262
    
    let COLOSSEUM_LAT = 41.8902
    let COLOSSEUM_LONG = 12.4922
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mapView.delegate = self
        
    }

    @IBAction func crossroadsLoc(_ sender: Any) {
    let point = MKMapPoint(CLLocationCoordinate2D(latitude: CROSSROADS_LAT, longitude: CROSSROADS_LONG))
    let size = MKMapSize(width: 1000, height: 1000)
    let rect = MKMapRect(origin: point, size: size)
    mapView.setRegion(MKCoordinateRegion(rect), animated: true)
    }
    
    @IBAction func stonehengeLoc(_ sender: Any) {
   let point = MKMapPoint(CLLocationCoordinate2D(latitude: STONEHENGE_LAT, longitude: STONEHENGE_LONG))
      let size = MKMapSize(width: 1000, height: 1000)
      let rect = MKMapRect(origin: point, size: size)
      mapView.setRegion(MKCoordinateRegion(rect), animated: true)
    }
    
    @IBAction func colosseum(_ sender: Any) {
 let point = MKMapPoint(CLLocationCoordinate2D(latitude: COLOSSEUM_LAT, longitude: COLOSSEUM_LONG))
    let size = MKMapSize(width: 1000, height: 1000)
    let rect = MKMapRect(origin: point, size: size)
    mapView.setRegion(MKCoordinateRegion(rect), animated: true)
    }
    
    
    @IBAction func zoomOut(_ sender: Any) {
        changeZoom(1)
    }
    
    @IBAction func zoomIn(_ sender: Any) {
        changeZoom(-1)
    }
    
    func changeZoom(_ exp: Double) {
        /*
        // Uses MKMapRect to create and set region
        let factor = pow(2, exp)
        let rect = mapView.visibleMapRect
        let newSize = MKMapSize(width: rect.width * factor, height: rect.height * factor)
        let newRect = MKMapRect(origin: rect.origin, size: newSize)
        mapView.setRegion(MKCoordinateRegion(rect), animated: true)
        */
        // Uses MKCoordinateSpan to create and set region
        let region = mapView.region
        let newLat = region.span.latitudeDelta * pow(2, exp)
        let newLong = region.span.longitudeDelta * pow(2, exp)
        let newCoordinateSpan = MKCoordinateSpan(latitudeDelta: newLat, longitudeDelta: newLong)
        let newRegion = MKCoordinateRegion(center: region.center, span: newCoordinateSpan)
        mapView.setRegion(newRegion, animated: true)
    }
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        
        let rect = mapView.visibleMapRect
        
        let crossroadsLoc = CLLocationCoordinate2D(latitude: CROSSROADS_LAT, longitude: CROSSROADS_LONG)
        let crossroadsPoint = MKMapPoint(crossroadsLoc)
       
        let stonehengeLoc = CLLocationCoordinate2D(latitude: STONEHENGE_LAT, longitude: STONEHENGE_LONG)
        let stonehengePoint = MKMapPoint(stonehengeLoc)
       
        let colosseumLoc = CLLocationCoordinate2D(latitude: COLOSSEUM_LAT, longitude: COLOSSEUM_LONG)
        let colosseumPoint = MKMapPoint(colosseumLoc)
       
        if rect.contains(crossroadsPoint) {
            crossroadsLabel.text = "It's Crossroads!"
        } else if rect.contains(stonehengePoint){
            crossroadsLabel.text = "It's Stonehenge!"
        } else if rect.contains(colosseumPoint){
            crossroadsLabel.text = "It's the Colosseum!"
        } else {
            crossroadsLabel.text = " "
        }
    
        
    }
}

