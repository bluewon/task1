//
//  Log.swift
//  task1
//
//  Created by Quan Tran on 7/17/17.
//  Copyright © 2017 Quan Tran. All rights reserved.
//

import Foundation
class Log: NSObject {

    static func DLog(message: String, function: String = #function) {
        #if !NDEBUG
            NSLog("%@ -- %@", function, message)
        #endif
    }
}
