//
//  PersonHeaderViewCell.swift
//  Users
//
//  Created by Sabina Buruiana on 2/28/17.
//  Copyright © 2017 Sabina Buruiana. All rights reserved.
//

import UIKit

class PersonHeaderViewCell: UITableViewCell {
    
    @IBOutlet weak var personName: UILabel!
    @IBOutlet weak var personJob: UILabel!
    @IBOutlet weak var personImageView: RoundFullCircleView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
