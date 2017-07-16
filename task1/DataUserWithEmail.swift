//
//  DataUserWithEmail.swift
//  task1
//
//  Created by Quan Tran on 7/5/17.
//  Copyright © 2017 Quan Tran. All rights reserved.
//

import Foundation
struct DataUserWithEmail {
    var license: String = ""
    var email: String  = ""

    func toJson() -> Any {
        return [   "license": self.license,
                   "email": self.email ]
    }
}
