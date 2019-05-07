//
//  ViewController.swift
//  Mission_05
//
//  Created by 정재훈 on 18/03/2019.
//  Copyright © 2019 정재훈. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var myWebView: UIWebView!
    
    func loadWebView(_ url: String) {
        let myUrl = URL(string: url)
        let myRequest = URLRequest(url: myUrl!)
        myWebView.loadRequest(myRequest)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let myHtmlBundle = Bundle.main
        let filePath = myHtmlBundle.path(forResource: "WorkFlowy", ofType: "html")
        loadWebView(filePath!)
    }
}
