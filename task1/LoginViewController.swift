//
//  LoginViewController.swift
//  task1
//
//  Created by Quan Tran on 7/4/17.
//  Copyright © 2017 Quan Tran. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let v = UIView()
        view.addSubview(v)
        v.translatesAutoresizingMaskIntoConstraints = false
        v.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        v.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        v.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        v.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        v.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
    }


    

}
