//
//  ViewController.swift
//  Map Demo
//
//  Created by Fabian Vergara on 2016-06-06.
//  Copyright © 2016 fvergara. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    
    @IBOutlet var map: MKMapView!
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        
        
        //It could be done in less lines but as I am learning I rather see everything like this, for now.
        
        //40.758585, -73.985104
        
        let latitude : CLLocationDegrees = 40.758585
        let longitude: CLLocationDegrees = -73.985104
        
        let latDelta : CLLocationDegrees = 0.05
        let longDelta: CLLocationDegrees = 0.05
        
        let span : MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
        
        let location : CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        
        let region : MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        map.setRegion(region, animated: true)
        
        let annotation : MKPointAnnotation = MKPointAnnotation()
        
        annotation.coordinate = location
        
        annotation.title = "Times Square"
        
        annotation.subtitle = "Where I'll buy some bread tonight"
        
        map.addAnnotation(annotation)
        
        let uilpgr = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.action(_:)))
        
        uilpgr.minimumPressDuration = 2
        
        map.addGestureRecognizer(uilpgr)
        
      //  uilpgr.minimunPressDuration(2)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func action(gestureRecognizer: UIGestureRecognizer){
        
        let touchPoint = gestureRecognizer.locationInView(self.map)
        
        let newCoordinate: CLLocationCoordinate2D = map.convertPoint(touchPoint, toCoordinateFromView: self.map)
        print("Gesture recognized")
                
        let annotation : MKPointAnnotation = MKPointAnnotation()
        
        annotation.coordinate = newCoordinate
        
        annotation.title = "New place for user"
        
        annotation.subtitle = "Where I'll buy some bread tonight"
        
        map.addAnnotation(annotation)
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let userLocation : CLLocation = locations[0]
        
        let latitude = userLocation.coordinate.latitude
        let longitude = userLocation.coordinate.longitude
        
        let latDelta : CLLocationDegrees = 0.05
        let longDelta: CLLocationDegrees = 0.05
        
        let span : MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
        
        let location : CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        
        let region : MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        let annotation: MKPointAnnotation = MKPointAnnotation()
        
        annotation.coordinate = location
        
        annotation.title = "User position"
        
        map.addAnnotation(annotation)

        map.setRegion(region, animated: true)
        
        print(locations)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

