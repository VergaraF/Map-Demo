//
//  ViewController.swift
//  Map Demo
//
//  Created by Fabian Vergara on 2016-06-06.
//  Copyright © 2016 fvergara. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet var map: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //It could be done in less lines but as I am learning I rather see everything like this, for now.
        
        var latitude : CLLocationDegrees = 40.7
        var longitude: CLLocationDegrees = -73.9
        
        var latDelta : CLLocationDegrees = 0.01
        var longDelta: CLLocationDegrees = 0.01
        
        var span : MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
        
        var location : CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        
        var region : MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        map.setRegion(region, animated: true)
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

