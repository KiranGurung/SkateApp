//
//  HomeViewController.swift
//  Snapchat Camera
//
//  Created by ashika shanthi on 2/17/18.
//  Copyright © 2018 ashika shanthi. All rights reserved.
//

import UIKit
import Firebase

class ProfileViewController: UIViewController {
    var ref = Database.database().reference()
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var gamesLabel: UILabel!
    @IBOutlet weak var coinsLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var bioLabel: UILabel!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        let userID = Auth.auth().currentUser?.uid
        var bio = ""
        var name = "null"
        var username = "null"
        var coins = "0"
        var games = "0"
        
        _ = ref.child("users").child(userID!).observe(DataEventType.value, with: { (snapshot) in
            let userDict = snapshot.value as? [String : AnyObject] ?? [:]
            name = userDict["name"] as? String ?? "null"
            coins = userDict["points"] as? String ?? "000"
            games = userDict["games"] as? String ?? "0000"
            self.nameLabel.text = "Name: " + name
            self.gamesLabel.text = "Games: " + games
            self.coinsLabel.text = "Coins: " + coins
            self.usernameLabel.text = username
            self.bioLabel.text = "Bio: " + bio
        })
        { (error) in
            print(error.localizedDescription)
        }
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

