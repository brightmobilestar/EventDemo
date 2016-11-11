//
//  APIProtocols.swift
//  DatingApp
//
//  Created by Steven Jimy   on 11/11/16.
//  Copyright © 2016 Steven Jimy . All rights reserved.
//

import Foundation

protocol APIProtocols {
    func getURL() -> URL
    func parseResponse(response : Any) -> Any
}
