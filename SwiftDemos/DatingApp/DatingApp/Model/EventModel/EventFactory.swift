//
//  EventFactory.swift
//  DatingApp
//
//  Created by Steven Jimy   on 11/10/16.
//  Copyright © 2016 Steven Jimy . All rights reserved.
//

import UIKit

protocol EventFactoryDelegate{
    func eventFactoryGetEventsSuccessHandler(events : NSArray)
    func eventFactoryGetEventsErrorHandler(error : NSError)
}


class EventFactory: NSObject {

    let GET_EVENT_URL : String = "http://104.236.141.246/api/events"
    
    var delegate : EventFactoryDelegate?
    
    
    func getEventWithDelegate(delegation : EventFactoryDelegate){
        let url = URL(string: GET_EVENT_URL)
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            let results : NSMutableArray = []
            guard error == nil else {
                print(error)
                delegation.eventFactoryGetEventsErrorHandler(error: error as! NSError)
                return
            }
            guard let data = data else {
                print("Data is empty")
                delegation.eventFactoryGetEventsSuccessHandler(events: results)
                return
            }
            
            let json = try! JSONSerialization.jsonObject(with: data, options: []) as! [AnyObject]
            print(json)
            for item in json {
                let event : EventModel = EventModel()
                event.eventId = String(describing: item["id"] as! NSNumber)
                event.eventName = (item["name"] as? String)!
                event.eventDate = (item["date"] as? String)!
                event.eventAddress = (item["address"] as? String)!
                event.eventSuburb = (item["suburb"] as? String)!
                event.eventState = (item["state"] as? String)!
                event.eventCountry = (item["country"] as? String)!
                results.add(event)
            }
            delegation.eventFactoryGetEventsSuccessHandler(events: results)
            print(results)
        }
        task.resume()
    }
}
