//
//  UserModel.swift
//  DatingApp
//
//  Created by Steven Jimy   on 11/10/16.
//  Copyright © 2016 Steven Jimy . All rights reserved.
//

import UIKit

class UserModel: NSObject {
    var firstname : String = ""
    var lastname : String = ""
    
    public func getNameString() -> String{
        return (firstname + lastname)
    }
}

