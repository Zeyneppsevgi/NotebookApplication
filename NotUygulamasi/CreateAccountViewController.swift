//
//  CreateAccountViewController.swift
//  NotUygulamasi
//
//  Created by Zeynep Sevgi on 16.10.2022.
//

import UIKit
import Firebase

class CreateAccountViewController: UIViewController {
    
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func createButtonTiklandi(_ sender: UIButton) {
        guard let email=emailTextField.text else {
            return
        }
        guard let password = passwordTextField.text else {
            return
        }
        Auth.auth().createUser(withEmail: email, password: password) { firebaseResult, error in
            if let e = error {
                print("error")
            }
            else{
                self.performSegue(withIdentifier: "goToNext", sender: self)
            }
        }
    }
    

}
