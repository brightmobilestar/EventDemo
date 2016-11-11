//
//  UserFactory.swift
//  DatingApp
//
//  Created by Steven Jimy   on 11/10/16.
//  Copyright © 2016 Steven Jimy . All rights reserved.
//

import UIKit

protocol UserFactoryDelegate {
    func getGuestsSuccessHandler(guests : NSArray)
    func getGuestsErrorHandler(error : NSError)
}

class UserFactory: NSObject {
    let API_GET_GUESTS_URL : String = "http://104.236.141.246/api/guests/"
    var delegate : UserFactoryDelegate?
    
    func getGuestsOfEvent(eventId : String, delegation : UserFactoryDelegate) {
        let url = URL(string: (API_GET_GUESTS_URL + eventId))
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            let results : NSMutableArray = []
            guard error == nil else {
                print(error)
                delegation.getGuestsErrorHandler(error: error as! NSError)
                return
            }
            guard let data = data else {
                print("Data is empty")
                delegation.getGuestsSuccessHandler(guests: results)
                return
            }
            
            let json = try! JSONSerialization.jsonObject(with: data, options: []) as! NSDictionary
            print(json)
            for item in (json.object(forKey: "guests") as? [AnyObject])! {
                let user : UserModel = UserModel()
                user.firstname = (item["firstname"] as? String)!
                user.lastname = (item["lastname"] as? String)!
                results.add(user)
            }
            delegation.getGuestsSuccessHandler(guests: results)
            print(results)
        }
        task.resume()
    }
    
}
