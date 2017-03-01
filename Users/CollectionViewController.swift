//
//  AppDelegate.swift
//  HelloWorld
//
//  Created by Sabina Buruiana on 21/02/2017.
//  Copyright © 2017 Sabina Buruiana. All rights reserved.
//

import UIKit
import SDWebImage

private let reuseIdentifier = "CollectionViewCell"

class CollectionViewController: UICollectionViewController {

    
    var arrayFromServer: [Person] = []
    
    var selectedCell: Int = 0
    
    var nextPageToLoad: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView?.reloadData()
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(didReceiveUsersDataNotification),
                                                 name: NSNotification.Name(rawValue: "PersonsSreverRequestDidFinish"),
                                                 object:nil)
        
        ServerManager.sharedManager.requestUsers(nextPageToLoad)
        
        self.title = "Users"
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.arrayFromServer.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! PersonCollectionViewCell
        
        let currentPersonDictionary = arrayFromServer[indexPath.row] as Person
        cell.name.text = currentPersonDictionary.firstName!.capitalized + " " + currentPersonDictionary.lastName!.capitalized
        cell.job.text = "24 years from FR"
        if let profilePicture = currentPersonDictionary.mediumURL {
        cell.imageView.sd_setImage(with:URL(string:profilePicture) )
        }
        if self.selectedCell == indexPath.row {
            cell.name.textColor = UIColor.red
            cell.backgroundColor = UIColor.gray
        } else {
            cell.name.textColor = UIColor.black
            cell.backgroundColor = UIColor.clear

        }
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectedCell = indexPath.row
        collectionView.reloadData()
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc: TableViewController = storyboard.instantiateViewController(withIdentifier: "TableViewController") as! TableViewController
        vc.person = arrayFromServer[self.selectedCell]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row / 10 == 0 && nextPageToLoad > 0 {
            ServerManager.sharedManager.requestUsers(nextPageToLoad)
        }
    }
    
    //MARK: - Server Response
    func didReceiveUsersDataNotification(notification: NSNotification) {
        if notification.userInfo?["success"] as! Bool == true {
            DispatchQueue.main.async() {
                let users = notification.userInfo?["persons"] as! [Person]
                self.arrayFromServer = users
                self.nextPageToLoad = -1
                self.collectionView?.reloadData()
            }
        }
    }
    
}
