//
//  DataWithEmail.swift
//  task1
//
//  Created by Quan Tran on 7/4/17.
//  Copyright © 2017 Quan Tran. All rights reserved.
//

import Foundation
struct DataForPassWithEmail {
    var userName: String = ""
    var email: String  = ""

    func toJson2() -> Any {
        return [   "userName": self.userName,
            "email": self.email ]
    }
}
