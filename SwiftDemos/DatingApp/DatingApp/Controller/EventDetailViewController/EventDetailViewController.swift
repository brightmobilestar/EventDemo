//
//  EventDetailViewController.swift
//  DatingApp
//
//  Created by Steven Jimy   on 11/10/16.
//  Copyright © 2016 Steven Jimy . All rights reserved.
//

import UIKit

class EventDetailViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource, UserFactoryDelegate {
    @IBOutlet weak var eventDetailTableView: UITableView!
    let cellArray : NSMutableArray = []
    var guestArray : NSMutableArray = []
    var eventModel : EventModel!
    
    
    // MARK : Button action
    @IBAction func touchBackButton(_ sender: AnyObject) {
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        initCells()
        getData()
    }
    
    func getData() {
        let userFactory : UserFactory = UserFactory()
        userFactory.getGuestsOfEvent(eventId: eventModel.eventId, delegation: self)
    }
    
    // MARK : UserFactoryDelegate
    func getGuestsErrorHandler(error: NSError) {
        guestArray = NSMutableArray()
        DispatchQueue.main.async {
            self.eventDetailTableView.reloadData()
        }
    }
    
    func getGuestsSuccessHandler(guests: NSArray) {
        guestArray = NSMutableArray(array: guests)
        DispatchQueue.main.async {
            self.eventDetailTableView.reloadData()
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 150
        case 1:
            return 150
        case 2:
            return 90
        default:
            return 0
        }
    }
    
    func initCells() {
        let cellEventSlideIdentifier : String = "cellEventSlideIdentifier"
        let cellEventInforIdentifier : String = "cellEventInforIdentifier"
        let cellEventGuestsIdentifier : String = "cellEventGuestsIdentifier"
        
        
        let cellSlideNib : UINib = UINib(nibName: "EventSlideTableViewCell", bundle: nil)
        eventDetailTableView.register(cellSlideNib, forCellReuseIdentifier: cellEventSlideIdentifier)
        let cellSlide : EventSlideTableViewCell = eventDetailTableView.dequeueReusableCell(withIdentifier: cellEventSlideIdentifier) as! EventSlideTableViewCell
        cellArray.add(cellSlide)
        
        let cellInforNib : UINib = UINib(nibName: "EventInforTableViewCell", bundle: nil)
        eventDetailTableView.register(cellInforNib, forCellReuseIdentifier: cellEventInforIdentifier)
        let cellInfor : EventInforTableViewCell = eventDetailTableView.dequeueReusableCell(withIdentifier: cellEventInforIdentifier) as! EventInforTableViewCell
        cellArray.add(cellInfor)
        
        let cellGuestNib : UINib = UINib(nibName: "EventGuestsTableViewCell", bundle: nil)
        eventDetailTableView.register(cellGuestNib, forCellReuseIdentifier: cellEventGuestsIdentifier)
        let cellGuest : EventGuestsTableViewCell = eventDetailTableView.dequeueReusableCell(withIdentifier: cellEventGuestsIdentifier) as! EventGuestsTableViewCell
        cellArray.add(cellGuest)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell : EventSlideTableViewCell = cellArray.object(at: 0) as! EventSlideTableViewCell
            return cell
        case 1:
            let cell : EventInforTableViewCell = cellArray.object(at: 1) as! EventInforTableViewCell
            return cell
        case 2:
            let cell : EventGuestsTableViewCell = cellArray.object(at: 2) as! EventGuestsTableViewCell
            cell.reloadView(guests: guestArray)
            return cell
        default:
            let cell : EventSlideTableViewCell = cellArray.object(at: 0) as! EventSlideTableViewCell
            
            return cell
        }
    }
}
