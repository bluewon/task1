//
//  DataforPass.swift
//  task1
//
//  Created by Quan Tran on 7/4/17.
//  Copyright © 2017 Quan Tran. All rights reserved.
//

import Foundation
struct DataPassWithNumPhone {
    var userName: String = ""
    var phoneNumber: String = ""

    func toJson() -> Any{
        return [   "userName": self.userName,
                    "phoneNumber": self.phoneNumber
        ]
    }
}
