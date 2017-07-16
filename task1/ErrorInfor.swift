//
//  ErrorInfor.swift
//  task1
//
//  Created by Quan Tran on 7/12/17.
//  Copyright © 2017 Quan Tran. All rights reserved.
//

import Foundation


enum errorEmail: Error{
    case emptyEmail
    case errorFormatEmail
}

enum errorNumberPhone: Error{
    case emptyNumberPhone
    case notNumber
    case numberPhoneNotExist
}

enum errorLicense:Error{
    case emptyLicense
    case notValidLicense
    case notExistLicense
}
enum errorDate:Error{
    case emptyDate
    case errorFormat
    
}
