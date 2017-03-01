//
//  TableViewController.swift
//  Users
//
//  Created by Sabina Buruiana on 2/27/17.
//  Copyright © 2017 Sabina Buruiana. All rights reserved.
//

import UIKit
import SDWebImage

class TableViewController: UITableViewController {

    var person: Person?
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var userImageView: RoundFullCircleView!
    @IBOutlet weak var jobLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = (person?.firstName)! + " " + (person?.lastName)!
        phoneLabel.text = person?.phone
        emailLabel.text = person?.email
        addressLabel.text = (person?.city)! + " " + (person?.street)!
        jobLabel.text = "HR"
        usernameLabel.text = person?.username
        if let picture = person?.mediumURL {
           userImageView.sd_setImage(with:URL(string:picture))
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
