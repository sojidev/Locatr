//
//  LoginViewController.swift
//  Locatr
//
//  Created by iwritecode on 3/2/17.
//  Copyright © 2017 iwc. All rights reserved.
//

import UIKit


// MARK: - Login View Controller

class LoginViewController: UIViewController {
    
    
    // MARK: IBOutlets
    
    @IBOutlet weak var facebookLoginButton: UIButton!
    @IBOutlet weak var skipLoginButton: UIButton!
    
    
    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        configureViews()
        
    }

    
    // MARK: UI Functions
    
    func configureViews() {
        customizeAppearance()
    }
    
    func customizeAppearance() {
        
        // Facebook login button
        facebookLoginButton.layer.borderColor = UIColor(hexString: "47609b").cgColor
        facebookLoginButton.layer.borderWidth = 0.25
        facebookLoginButton.layer.cornerRadius = 3.0
        
    }
    
    // MARK: IBActions
    
    @IBAction func facebookLoginButtonPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func skipLoginButtonPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: Segues.Identifiers.fromLoginToLocation, sender: self)
    }
    

}
