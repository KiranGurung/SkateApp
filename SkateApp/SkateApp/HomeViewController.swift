//
//  HomeViewController.swift
//  Snapchat Camera
//
//  Created by ashika shanthi on 2/17/18.
//  Copyright © 2018 ashika shanthi. All rights reserved.
//

import UIKit
import Firebase

class HomeViewController: UIViewController {
    var ref = Database.database().reference()
    
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        let userID = Auth.auth().currentUser?.uid
        ref.child("users").child(userID!).observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            let value = snapshot.value as? NSDictionary
            self.nameLabel.text = value?["name"] as? String ?? ""
            // ...
        }) { (error) in
            print(error.localizedDescription)
        }
        playButton.addTarget(self, action: #selector(viewGames), for: .touchDown)
    }
    
    @objc func viewGames(sender: UIButton!) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "Challenges") as! Challenges
        self.present(nextViewController, animated:true, completion:nil)
    }
    
    @IBAction func logOutAction(_ sender: Any) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let initial = storyboard.instantiateInitialViewController()
        UIApplication.shared.keyWindow?.rootViewController = initial
    }
}

