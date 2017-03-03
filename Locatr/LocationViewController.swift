//
//  LocationViewController.swift
//  Locatr
//
//  Created by iwritecode on 3/2/17.
//  Copyright © 2017 iwc. All rights reserved.
//


import CoreLocation
import GoogleMaps
import UIKit

class LocationViewController: UIViewController {
    
    // MARK: IBOutlets
    
    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var currentLocationSwitch: UISwitch!
    @IBOutlet weak var addressField: UITextField!
    
    
    // Location properties
    var locationManager = CLLocationManager()
    let latDelta: CLLocationDegrees = 0.05
    let lonDelta: CLLocationDegrees = 0.05
    var latitude: CLLocationDegrees?
    var longitude: CLLocationDegrees?
    var address: String?
    var locationMarker: GMSMarker!
    
    let startingCoordinate = CLLocationCoordinate2D(latitude: 29.76, longitude: -95.37)
    
    // Variables and constants
    
    var useCurrentLocation: Bool!
    
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViews()

    }
    
    
    // MARK: Custom UI functions
    
    func configureViews() {
        addressField.isHidden = currentLocationSwitch.isOn ? true : false
        
        configureMap()
    }
    
    func configureMap() {
        
        let camera = GMSCameraPosition.camera(withTarget: startingCoordinate, zoom: 12)
        mapView.camera = camera
        
        mapView.addObserver(self, forKeyPath: "myLocation", options: .new, context: nil)
        
        // Create and add location pin
        let marker = GMSMarker()
        marker.appearAnimation = .pop
        marker.position = startingCoordinate
        marker.map = mapView
    }
    
    

}
