//
//  EventViewController.swift
//  DatingApp
//
//  Created by Steven Jimy   on 11/10/16.
//  Copyright © 2016 Steven Jimy . All rights reserved.
//

import UIKit

class EventViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource, EventFactoryDelegate {
    @IBOutlet weak var eventTableView: UITableView!
    let cellIdentifier : String = "cellIdentifier"
    var listEvent : NSMutableArray = []

    override func viewDidLoad() {
        super.viewDidLoad()

        let cellNib : UINib = UINib(nibName: "EventTableViewCell", bundle: nil)
        eventTableView.register(cellNib, forCellReuseIdentifier: cellIdentifier)
        getEvents()
    }
    
    func getEvents() {
        let eventFactory : EventFactory = EventFactory()
        eventFactory.getEventWithDelegate(delegation: self)
    }

    // MARK : EventFactoryDelegate
    func eventFactoryGetEventsErrorHandler(error: NSError) {
        listEvent = NSMutableArray()
        DispatchQueue.main.async {
            self.eventTableView.reloadData()
        }
    }
    
    func eventFactoryGetEventsSuccessHandler(events: NSArray) {
        listEvent = NSMutableArray(array: events)
        DispatchQueue.main.async {
            self.eventTableView.reloadData()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK : UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listEvent.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : EventTableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! EventTableViewCell
        cell.setEventModel(event: listEvent.object(at: indexPath.row) as! EventModel)
        return cell
    }
    
    // MARK : UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let eventDetailVC : EventDetailViewController = EventDetailViewController(nibName: "EventDetailViewController", bundle: nil)
        eventDetailVC.eventModel = listEvent.object(at: indexPath.row) as! EventModel
        self.navigationController?.pushViewController(eventDetailVC, animated: true)
    }

}
