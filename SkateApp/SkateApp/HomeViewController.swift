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
    @IBOutlet weak var gamesLabel: UILabel!
    @IBOutlet weak var coinsLabel: UILabel!
    @IBOutlet weak var homeTab: UITabBarItem!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        let userID = Auth.auth().currentUser?.uid
        var name = "null"
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
        })
        { (error) in
            print(error.localizedDescription)
        }

        
        let appearance = UITabBarItem.appearance()
        let attributes = [NSAttributedStringKey.font:UIFont(name: "American Typewriter", size: 20)]
        appearance.setTitleTextAttributes(attributes as [NSAttributedStringKey : Any], for: .normal)
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

