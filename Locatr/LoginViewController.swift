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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if FBSDKAccessToken.current() == nil {
            return
        } else {
            
            print("You are logged in to Facebook")
            
            self.performSegue(withIdentifier: Segues.Identifiers.fromLoginToLocation, sender: self)
        }
        
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
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(okAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    // MARK: Facebook login method(s)
    
    
    
    // MARK: IBActions
    
    @IBAction func facebookLoginButtonPressed(_ sender: UIButton) {
        let facebookLoginManager = FBSDKLoginManager()
        facebookLoginManager.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            
            if error != nil {
                let message = "Not logged in to Facebook"
                self.showAlert(title: "", message: message)
            } else {
                let loginResult: FBSDKLoginManagerLoginResult = result!
                
                if loginResult.isCancelled {
                    return
                } else if loginResult.grantedPermissions.contains("email") {
                    print("Successfully logged in to facebook with email")
                }
            }
            
        }
    }
    
    @IBAction func skipLoginButtonPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: Segues.Identifiers.fromLoginToLocation, sender: self)
    }
    

}
