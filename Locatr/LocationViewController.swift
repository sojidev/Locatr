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
    
    var locationManager = CLLocationManager()
    let latDelta: CLLocationDegrees = 0.05
    let lonDelta: CLLocationDegrees = 0.05
    var latitude: CLLocationDegrees?
    var longitude: CLLocationDegrees?
    
    var address: String?
    
    var locationMarker: GMSMarker!
    
    
    // Variables and constants
    
    var useCurrentLocation: Bool!
    
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
    
    // MARK: Custom UI functions
    
    func configureViews() {
        addressField.isHidden = currentLocationSwitch.isOn ? true : false

    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
