//
//  HomeViewController.swift
//  Snapchat Camera
//
//  Created by ashika shanthi on 2/17/18.
//  Copyright © 2018 ashika shanthi. All rights reserved.
//

import UIKit
import Firebase

class InfoViewController: UIViewController, UITextFieldDelegate {
    var gradient:CAGradientLayer?
    var ref = Database.database().reference()
    
    //Mark: Properties
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var hometownTextField: UITextField!
    @IBOutlet weak var stanceTextField: UITextField!
    @IBOutlet weak var bioTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addGradient()
        nameTextField.delegate = self
        ageTextField.delegate = self
        hometownTextField.delegate = self
        stanceTextField.delegate = self
        bioTextField.delegate = self
    }
    
    @IBAction func register(_ sender: Any) {
        let name = nameTextField.text
        let age = ageTextField.text
        let hometown = hometownTextField.text
        let stance = stanceTextField.text
        let bio = bioTextField.text
        
        if name?.isEmpty == true{
            let alertController = UIAlertController(title: "Name Invalid", message: "Please Enter A Valid Name", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
        }
        
        if Int(age!) == nil{
            let alertController = UIAlertController(title: "Age Invalid", message: "Please Enter A Valid Age", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
        }
        
        if Auth.auth().currentUser == nil{
            print("Error, please wait")
        }
        else{
        self.ref.child("users").child(Auth.auth().currentUser!.uid).setValue(["name": name, "age": age, "hometown": hometown, "stance": stance, "bio": bio, "points": 100, "wins": 0])
            self.performSegue(withIdentifier: "infoToHome", sender: self)
        }
    }
    
    func addGradient() {
        gradient = CAGradientLayer()
        let startColor = UIColor(red: 5/255, green: 171/255, blue: 224/255, alpha: 1)
        let endColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        gradient?.colors = [startColor.cgColor,endColor.cgColor]
        gradient?.startPoint = CGPoint(x: 0, y: 0)
        gradient?.endPoint = CGPoint(x: 0, y:1)
        gradient?.frame = view.frame
        self.view.layer.insertSublayer(gradient!, at: 0)
    }
}

