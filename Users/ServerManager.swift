///
//  AppDelegate.swift
//  HelloWorld
//
//  Created by Sabina Buruiana on 21/02/2017.
//  Copyright © 2017 Sabina Buruiana. All rights reserved.
///

import UIKit

class ServerManager: NSObject {

    static let sharedManager = ServerManager()
    
    func requestUsers(_ page: Int)
    {
        var requestDidFinishSuccesfully = false
        
        let url = "https://randomuser.me/api/?page=\(page)&results=10&seed=abc"
        
        let request = NSMutableURLRequest(url: NSURL(string:url) as! URL)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            data, response, error in
            
            var serverResponse: [Person] = []
            
            if error == nil
            {
                if let responseDictionary: NSDictionary = (try? JSONSerialization.jsonObject(with: data!, options: [])) as? NSDictionary
                {
                    if let httpResponse:HTTPURLResponse = response as? HTTPURLResponse
                    {
                        if (200...299 ~= httpResponse.statusCode)
                        {
                            //Success
                            requestDidFinishSuccesfully = true
                            print(responseDictionary)
                            
                            if let persons = responseDictionary["results"] as? [[String: Any]]{
                                for person in persons {
                                    let persObj = Person(fromDictionary: person as [String: Any])
                                    serverResponse.append(persObj)
                                }
                            }
                        }
                    }
                }
            }
            
            DispatchQueue.main.async() {
                let userInfo = ["success" : requestDidFinishSuccesfully as AnyObject, "persons": serverResponse as AnyObject] as Dictionary<String, AnyObject>
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "PersonsSreverRequestDidFinish"), object: nil, userInfo: userInfo)
            }
        }
        
        task.resume()
        
    }
}
