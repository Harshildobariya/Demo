//
//  ViewController.swift
//  Demo
//
//  Created by Harshil sureshbhai dobariya on 13/09/18.
//  Copyright © 2018 Harshil sureshbhai dobariya. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {
    
    @IBOutlet weak var sgment: UISegmentedControl!
    
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    var isSignin:Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    @IBAction func sgmentClick(_ sender: Any) {
       // isSignin != isSignin
            let selectedsgment = sgment.selectedSegmentIndex
        if selectedsgment == 1{
            performSegue(withIdentifier: "signup", sender: nil  )
        }else{
            return
        }
       
    }
    @IBAction func Login(_ sender: Any) {
        
        guard let email = emailTF.text,
            email != "",
            let password = passwordTF.text,
            password != ""
            else {
                AlertController.showAlert(self, titel: "Missing Info", message: "Please fill out all required fields")
                return
        }
        
        Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
            guard error == nil else {
                AlertController.showAlert(self, titel: "Error", message: error!.localizedDescription)
                return
            }
            guard let user = user else { return }
            print(user.email ?? "MISSING EMAIL")
            print(user.displayName ?? "MISSING DISPLAY NAME")
            print(user.uid)
            
            self.performSegue(withIdentifier: "login", sender: nil)
            
            
        })
        
    }
    
}

