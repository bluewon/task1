//
//  AutoLayout.swift
//  cherry-app
//
//  Created by Quan Tran on 4/1/17.
//  Copyright © 2017 Quan Tran. All rights reserved.
//

import Foundation
import UIKit
extension UIView{
    func addContrainWithVS(format:String,views:UIView...){ // view... = mang view ([UIView])
        var dic:Dictionary<String,Any> = [:]
        for (index,value) in views.enumerated(){
            dic["v\(index)"] = value
        }
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: dic))
    }
    
}
