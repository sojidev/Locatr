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
    @IBOutlet weak var yesOrNoLabel: UILabel!
    @IBOutlet weak var showLocationButton: UIButton!
    
    // MARK: Constraints
    
    @IBOutlet weak var addressFieldCenterX: NSLayoutConstraint!
    
    
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
        
        customizeButtonAppearance()
        configureMap()
    }
    
    func configureMap() {
        
        // Set mapView starting location)
        let camera = GMSCameraPosition.camera(withTarget: startingCoordinate, zoom: 12)
        mapView.camera = camera
        
        // Check for changes to current location
        mapView.isMyLocationEnabled = true
        mapView.addObserver(self, forKeyPath: "myLocation", options: .new, context: nil)
        
        // Create and add location pin
        let marker = GMSMarker()
        marker.appearAnimation = .pop
        marker.position = startingCoordinate
        marker.map = mapView
    }
    
    func customizeButtonAppearance() {
        showLocationButton.layer.cornerRadius = showLocationButton.bounds.height / 2.0
    }
    
    func updateLabel() {
        if currentLocationSwitch.isOn {
            yesOrNoLabel.text = "Yes"
            yesOrNoLabel.textColor = UIColor.green
        } else {
            yesOrNoLabel.text = "No"
            yesOrNoLabel.textColor = UIColor.red
        }
    }
    
    
    //  MARK: IBActions
    
    @IBAction func currentLocationSwitchToggled(_ sender: UISwitch) {
        updateLabel()
         // addressField.isHidden = currentLocationSwitch.isOn ? true : false
        currentLocationSwitch.isOn ? addressField.hide() : addressField.show()
    }
    
    @IBAction func showLocationButtonPressed(_ sender: UIButton) {
        
        print("Show location button pressed!")
        
    }
    
}


// MARK: - UITextField Delegate function(s)

extension LocationViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        addressField.resignFirstResponder()
        return true
    }
    
}
