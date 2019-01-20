//
//  challengeCellWithNib.swift
//  SkateApp
//
//  Created by Kenji Mah on 1/19/19.
//  Copyright © 2019 Kenji Maolo Mah. All rights reserved.
//

import UIKit

class challengeCellWithNib: UICollectionViewCell {
    @IBOutlet weak var friendName: UILabel!
    
    @IBOutlet weak var challengeButton: UIButton!
    
    @IBOutlet weak var timeStamp: UILabel!
    
    @IBOutlet weak var userLetters: UILabel!
    
    @IBOutlet weak var friendLetters: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.backgroundColor = UIColor.blue
    }

}
