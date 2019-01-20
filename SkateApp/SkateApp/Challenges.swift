//
//  Challenges.swift
//  SkateApp
//
//  Created by Kenji Mah on 1/19/19.
//  Copyright © 2019 Kenji Maolo Mah. All rights reserved.
//

import UIKit
import Firebase

private let reuseIdentifier = "challengeCellWithNib"

class Challenges: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    var userGames = [NSDictionary]()
    let userName = "John"
    var ref: DatabaseReference!
    override func viewDidLoad() {
        super.viewDidLoad()

        var dataLoaded = 0
        
        print(userGames)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
//        collectionView?.backgroundColor = .black
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "challengeCellWithNib")
        collectionView?.register(UINib(nibName: "challengeCellWithNib", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        ref = Database.database().reference()
        ref.child("games").observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            let games = snapshot.value as? NSDictionary
            //            let username = value?["username"] as? String ?? ""
            //            let user = User(username: username)
            if((games) != nil){
                for(_, game) in games!{
                    if let gameData = game as? NSDictionary{
                        if(gameData["playerOne"] as! String == self.userName || gameData["playerTwo"] as! String == self.userName){
                            print(gameData)
                            self.userGames.append(gameData)
                        }
                    } else{
                        print("Not a dict")
                    }
                }
            }
            print(self.userGames)
            self.collectionView!.reloadData()

            // ...
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

//    override func numberOfSections(in collectionView: UICollectionView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return userGames.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! challengeCellWithNib
        
        // Configure the cell
        var playerNum = 0

        print(indexPath.row)
        if(userGames[indexPath.row]["playerOne"] as! String == userName){
            cell.friendName.text = userGames[indexPath.row]["playerTwo"] as? String
            cell.userLetters.text = userGames[indexPath.row]["lettersOne"] as? String
            cell.friendLetters.text = userGames[indexPath.row]["lettersTwo"] as? String
            playerNum = 1
        }else{
            cell.friendName.text = userGames[indexPath.row]["playerOne"] as? String
            cell.userLetters.text = userGames[indexPath.row]["lettersTwo"] as? String
            cell.friendLetters.text = userGames[indexPath.row]["lettersOne"] as? String
            playerNum = 2
        }
        cell.timeStamp.text = userGames[indexPath.row]["timeStarted"] as? String
        cell.challengeButton.addTarget(self, action: #selector(viewChallenge), for: .touchDown)
        return cell
    }

    @objc func viewChallenge(sender: UIButton!) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "ViewController") as! CameraController
        self.present(nextViewController, animated:true, completion:nil)
    }
    
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
