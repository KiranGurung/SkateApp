//
//  ViewController.swift
//  SkateApp
//
//  Created by KenjiMaoloMah on 1/18/19.
//  Copyright © 2019 Kenji Maolo Mah. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class ViewController: UIViewController {

    @IBOutlet var name: UITextField!
    @IBOutlet var email: UITextField!
    @IBOutlet var password: UITextField!
    @IBOutlet var confirmPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func signUpButton(_ sender: Any) {
        if validateEmail() == false {
            let alert = UIAlertController(title: "Invalid Email", message: "Your email seems to be invalid", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true)
        }
        if validatePassword() == false {
            let alert = UIAlertController(title: "Invalid Password", message: "Your password seems to be invalid", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true)
        }
    }
    
    public func validateEmail() -> Bool {
        if let emailText = email.text {
            if emailText.contains("@"){
                return true
            } else {
                return false
            }
        }
        return false
    }
    
    public func validatePassword() -> Bool {
        if let passwordText = password.text {
            if let confirmPasswordText = confirmPassword.text {
                if passwordText == confirmPasswordText {
                    return true
                }
            } else {
                return false
            }
        } else {
            return false
        }
        return false
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

