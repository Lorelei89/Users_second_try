//
//  AppDelegate.swift
//  HelloWorld
//
//  Created by Sabina Buruiana on 21/02/2017.
//  Copyright © 2017 Sabina Buruiana. All rights reserved.
//

import UIKit

class Person: NSObject {
    
    /*
     "gender":"female",
     "name":{
         "title":"miss",
         "first":"louane",
         "last":"vidal"
     },
     "location":{
         "street":"5307 place de l'église",
         "city":"courbevoie",
         "state":"bouches-du-rhône",
         "postcode":95660
     },
     "email":"louane.vidal@example.com",
     "login":{
         "username":"silverbear716",
         "password":"mylove",
         "salt":"VB5ywSDU",
         "md5":"3648c7f924c885e06c8be83dac24b6e5",
         "sha1":"71d2ebc044f8d03fea28508a825093d6d1fb5248",
         "sha256":"f0848680ab64980ac8d70ce59d9803030e541b9e635086c692b5b017b1e38feb"
     },
     "dob":"1994-12-31 14:12:33",
     "registered":"2008-01-12 13:34:34",
     "phone":"05-36-23-51-89",
     "cell":"06-80-78-08-31",
     "id":{
         "name":"INSEE",
         "value":"2941110177623 61"
     },
     "picture":{
         "large":"https://randomuser.me/api/portraits/women/79.jpg",
         "medium":"https://randomuser.me/api/portraits/med/women/79.jpg",
         "thumbnail":"https://randomuser.me/api/portraits/thumb/women/79.jpg"
     },
     "nat":"FR"
     */
    
    var firstName: String?
    var lastName: String?
    var street: String?
    var city: String?
    var email: String?
    var username: String?
    var password: String?
    var phone: String?
    var idName: String?
    var idValue: String?
    var largeURL: String?
    var mediumURL: String?
    var thumbnailURL: String?
    var nationality: String?
    
    var lastPage: Int = 1
    
    var didLoadLastPage: Bool = true
    
    override init() {
        super.init()
    }
    
    deinit{
    }
    
    init(fromDictionary dictionary: [String: Any]) {
        //Name Obj
        guard let nameDictionary = dictionary["name"] as? [String:String],
            let first = nameDictionary["first"],
            let last = nameDictionary["last"] else {
            return
        }
        self.firstName = first
        self.lastName = last
        
        //Location Obj
        guard let locationDictionary = dictionary["location"] as? [String:Any],
            let street = locationDictionary["street"] as? String,
            let city = locationDictionary["city"] as? String else {
                return
        }
        self.street = street
        self.city = city
        
        //Email
        if let email = dictionary["email"] as? String {
            self.email = email
        }
        
        //Login Obj
        guard let loginDictionary = dictionary["login"] as? [String:Any],
            let username = loginDictionary["username"] as? String,
            let password = loginDictionary["password"] as? String else {
                return
        }
        self.username = username
        self.password = password
        
        //Phone Obj
        if let phone = dictionary["phone"] as? String {
            self.phone = phone
        }
        
        //ID Obj
        guard let idDictionary = dictionary["id"] as? [String:Any],
            let idName = idDictionary["name"] as? String,
            let idValue = idDictionary["value"] as? String else {
                return
        }
        self.idName = idName
        self.idValue = idValue
        
        //Picture Obj
        guard let pictureDictionary = dictionary["id"] as? [String:Any],
            let largeURL = pictureDictionary["large"] as? String,
            let mediumURL = pictureDictionary["medium"] as? String,
            let thumbnailURL = pictureDictionary["thumbnail"] as? String else {
                return
        }
        self.largeURL = largeURL
        self.mediumURL = mediumURL
        self.thumbnailURL = thumbnailURL
        
        //Nationality Obj
        if let nationality = dictionary["nat"] as? String {
            self.nationality = nationality
        }
    }


}
