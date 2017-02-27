//
//  AppDelegate.swift
//  HelloWorld
//
//  Created by Sabina Buruiana on 21/02/2017.
//  Copyright © 2017 Sabina Buruiana. All rights reserved.
//

import UIKit

class PersonCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var imageView: RoundFullCircleView!
    @IBOutlet weak var job: UILabel!
    
    override func awakeFromNib() {
        self.layoutIfNeeded()
        layer.cornerRadius = self.frame.height / 6.0
        layer.masksToBounds = true
    }
}
