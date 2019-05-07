//
//  ViewController.swift
//  HelloWorld
//
//  Created by 정재훈 on 12/03/2019.
//  Copyright © 2019 정재훈. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbHello: UILabel!
    @IBOutlet weak var txtName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func btnSend(_ sender: Any) {
        lbHello.text = "Hello, " + txtName.text!
    }
}

