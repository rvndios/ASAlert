//
//  LoginKit.swift
//  ASAlert
//
//  Created by Aravind on 23/02/18.
//  Copyright © 2018 Aravind. All rights reserved.
//

import UIKit

class LoginKit: UIViewController {

    @IBOutlet weak var activity: UIActivityIndicatorView!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtotp: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.btnLogin.isEnabled = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func doSomething(_ login: Bool) {
        DispatchQueue.main.async
        {
            self.btnLogin.isEnabled = true
            self.activity.stopAnimating()
            if login {

            } else {

            }

        }
    }

    @IBAction func begin(_ sender: Any) {
        self.btnLogin.isEnabled = false

        DispatchQueue.main.async {
            self.activity.startAnimating()

        }
    }
}
