//
//  ViewController.swift
//  Tab
//
//  Created by 정재훈 on 20/03/2019.
//  Copyright © 2019 정재훈. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // let imageFile = UIImage(named: "File.png")
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // imageView.image = imageFile
    }
    
    @IBAction func btnMoveImageView(_ sender: UIButton) {
        tabBarController?.selectedIndex = 1
    }
    
    @IBAction func btnMoveDateView(_ sender: UIButton) {
        tabBarController?.selectedIndex = 2
    }
}
