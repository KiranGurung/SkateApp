//
//  StartViewController.swift
//  Snapchat Camera
//
//  Created by ashika shanthi on 2/27/18.
//  Copyright © 2018 ashika shanthi. All rights reserved.
//

import UIKit
import Firebase

class StartViewController: UIViewController {
    var gradient: CAGradientLayer?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addGradient()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if Auth.auth().currentUser != nil {
            print(Auth.auth().currentUser)
            self.performSegue(withIdentifier: "alreadyLoggedIn", sender: nil)
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
