//
//  ViewController.swift
//  CurrentLocationApp
//
//  Created by Ariana Kalili on 4/19/20.
//  Copyright © 2020 Ariana Kalili. All rights reserved.
//
import MapKit
import UIKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

   
    @IBOutlet weak var mapLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    var locationManager: CLLocationManager!
    var currentLoc: CLLocation!

    let CROSSROADS_LAT = 34.0240892
    let CROSSROADS_LONG = -118.4747321
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
   
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
        mapView.delegate = self
        
    }

    @IBAction func zoomOut(_ sender: Any) {
        changeZoom(1)
    }
    
    @IBAction func zoomIn(_ sender: Any) {
        changeZoom(-1)
    }
    
    func changeZoom(_ exp: Double) {
      
        let region = mapView.region
        let newLat = region.span.latitudeDelta * pow(2, exp)
        let newLong = region.span.longitudeDelta * pow(2, exp)
        let newCoordinateSpan = MKCoordinateSpan(latitudeDelta: newLat, longitudeDelta: newLong)
        let newRegion = MKCoordinateRegion(center: region.center, span: newCoordinateSpan)
        mapView.setRegion(newRegion, animated: true)
    }
    
    @IBAction func findCrossroads(_ sender: Any) {
    let point = MKMapPoint(CLLocationCoordinate2D(latitude: CROSSROADS_LAT, longitude: CROSSROADS_LONG))
    let size = MKMapSize(width: 1000, height: 1000)
    let rect = MKMapRect(origin: point, size: size)
    mapView.setRegion(MKCoordinateRegion(rect), animated: true)
    }
    @IBAction func findMe(_ sender: Any) {
        locationManager.requestLocation()
    }
    

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
       // let span = mapView.region.span
        let coords = locations.suffix(1)[0].coordinate
        let point = MKMapPoint(coords)
       // let newRegion = MKCoordinateRegion(center: coords, span: span)
        currentLoc = CLLocation(latitude: locations.suffix(1)[0].coordinate.latitude, longitude: locations.suffix(1)[0].coordinate.longitude)
        let size = MKMapSize(width: 1000, height: 1000)
        
           let rect = MKMapRect(origin: point, size: size)
           mapView.setRegion(MKCoordinateRegion(rect), animated: true)
       // mapView.setRegion(newRegion, animated: true)
        
      
    }
    

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    @IBAction func findDistance(_ sender: Any) {
      
        let crossroadsLoc = CLLocation(latitude: CROSSROADS_LAT, longitude: CROSSROADS_LONG)

        if currentLoc != nil {
            let distance : CLLocationDistance = round(currentLoc.distance(from: crossroadsLoc))
            
            mapLabel.text = "You are \(distance) m away from Crossroads"
        } else{
            mapLabel.text = "Sorry, you must Press find me before you can find the distance."
        }
    }
    
}
