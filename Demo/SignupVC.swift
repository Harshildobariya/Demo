//
//  SignupVC.swift
//  Demo
//
//  Created by Harshil sureshbhai dobariya on 14/09/18.
//  Copyright © 2018 Harshil sureshbhai dobariya. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignupVC: UIViewController {

    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!

    @IBOutlet weak var numberTF: UITextField!
    
    @IBOutlet weak var passwordTF: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }

    
    @IBAction func signup(_ sender: Any) {
   
        
        
        guard let username = nameTF.text,
            username != "",
            let email = emailTF.text,
            email != "",
            let password = passwordTF.text,
            password != "",
            let number = numberTF.text,
            number != ""
            
            else {
                AlertController.showAlert(self, titel: "Missing Info", message: "Please fill out all fields")
                return
        }
        
        Auth.auth().createUser(withEmail: email, password: password, completion: { (user, error) in
            
            guard error == nil else {
                AlertController.showAlert(self, titel: "Error", message: error!.localizedDescription)
                return
            }
            guard let user = user else { return }
            print(user.email ?? "MISSING EMAIL")
            print(user.uid)
            
            let changeRequest = user.createProfileChangeRequest()
            changeRequest.displayName = username
            changeRequest.commitChanges(completion: { (error) in
                guard error == nil  else {
                    AlertController.showAlert(self, titel: "Error", message: error!.localizedDescription)
                    return
                }
                
                self.performSegue(withIdentifier: "signin", sender: nil)
                DBprovide.Instance.saveUser(withID: user.uid, email: email, password: password, username: username, number: number)
                
            })
        })
    
    
    
    }
    
    
}
