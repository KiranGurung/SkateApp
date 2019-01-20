//
//  ChallengeCells.swift
//  SkateApp
//
//  Created by Kenji Mah on 1/19/19.
//  Copyright © 2019 Kenji Maolo Mah. All rights reserved.
//

import UIKit

class ChallengeCells: UICollectionViewCell {
    
    var friendName: UILabel!
    var timeStamp: UILabel!
    var userLetters: UILabel!
    var friendLetters: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit(){
        self.contentView.backgroundColor = .red

        timeStamp = UILabel(frame: contentView.frame)
        timeStamp.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(timeStamp)
        timeStamp.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
//        timeStamp.leftAnchor.constraint(equalTo: friendName.rightAnchor).isActive = true
        timeStamp.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        timeStamp.font = UIFont(name: timeStamp.font.fontName, size: 12)
        
        
        friendName = UILabel(frame: contentView.frame)
        friendName.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(friendName)
        friendName.topAnchor.constraint(equalTo: timeStamp.topAnchor).isActive = true
        friendName.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        friendName.widthAnchor.constraint(equalToConstant: 100).isActive = true
//        friendName.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        friendName.font = UIFont(name: friendName.font.fontName, size: 12)
        
        userLetters = UILabel(frame: contentView.frame)
        userLetters.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(userLetters)
        userLetters.topAnchor.constraint(equalTo: friendName.bottomAnchor).isActive = true
        userLetters.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
//        userLetters.rightAnchor.constraint(equalTo: friendLetters.leftAnchor).isActive = true
        userLetters.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        userLetters.font = UIFont(name: userLetters.font.fontName, size: 12)
        
        friendLetters = UILabel(frame: contentView.frame)
        friendLetters.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(friendLetters)
        friendLetters.topAnchor.constraint(equalTo: timeStamp.bottomAnchor).isActive = true
//        friendLetters.leftAnchor.constraint(equalTo: userLetters.rightAnchor).isActive = true
        friendLetters.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        friendLetters.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        friendLetters.font = UIFont(name: friendLetters.font.fontName, size: 12)
        
    }
}
