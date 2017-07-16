//
//  DataUserWithNumPhone.swift
//  task1
//
//  Created by Quan Tran on 7/5/17.
//  Copyright © 2017 Quan Tran. All rights reserved.
//

import Foundation
struct DataUserWithNumPhone {
    var license: String = ""
    var phoneNumber: String = ""

    func toJson() -> Any{
        return [   "license": self.license,
                   "phoneNumber": self.phoneNumber
        ]
    }
}
