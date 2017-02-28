//
//  TableViewController.swift
//  Users
//
//  Created by Sabina Buruiana on 2/27/17.
//  Copyright © 2017 Sabina Buruiana. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    
    var person: Person?
    override func viewDidLoad() {
        super.viewDidLoad()
    person = Person()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 2
    }
    
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userHeaderViewIndentifier") as! PersonHeaderViewCell
        cell.personName.text = (person?.firstName)! + (person?.lastName)!
        if let profilePicture = person?.mediumURL {
             cell.personImageView.sd_setImage(with:URL(string:profilePicture) )
        }
        cell.personJob.text = "24 years from FR"
        return cell.contentView
        }
        return nil
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30.0
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 180.0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIndentifier", for: indexPath) as! PersonTableViewCell
        switch indexPath.row {
        case 0:
            let headerView = tableView.dequeueReusableCell(withIdentifier: "cellIndentifier", for: indexPath) as! PersonHeaderViewCell
            return headerView
        case 1:
            cell.userTitleInfo.text = "Username"
            cell.userSubtitileInfo.text = person?.username
            return cell
        case 2:
            cell.userTitleInfo.text = "Email"
            cell.userSubtitileInfo.text = person?.email
            return cell
        case 3:
            cell.userTitleInfo.text = "Phone"
            cell.userSubtitileInfo.text = person?.phone
            return cell
        case 4:
            cell.userTitleInfo.text = "Address"
            cell.userSubtitileInfo.text = (person?.city)! + (person?.street)!
            return cell
        default:
            break
        }
        // Configure the cell...

        return cell
    }
    

}
