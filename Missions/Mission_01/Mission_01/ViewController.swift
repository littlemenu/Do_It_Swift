//
//  ViewController.swift
//  Mission_01
//
//  Created by 정재훈 on 13/03/2019.
//  Copyright © 2019 정재훈. All rights reserved.
//

import UIKit

var numImage = 0

class ViewController: UIViewController {
    
    @IBOutlet weak var imgViewer: UIImageView!
    
    var imageName = ["01.jpg", "02.jpg", "03.png", "04.jpg", "05.jpg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func btnPrev(_ sender: UIButton) {
        numImage = numImage - 1
        if (numImage < 0) {
            numImage = imageName.count - 1
        }
        imgViewer.image = UIImage(named: imageName[numImage])
    }
    
    @IBAction func btnNext(_ sender: UIButton) {
        numImage = numImage + 1
        if (numImage >= imageName.count) {
            numImage = 0
        }
        imgViewer.image = UIImage(named: imageName[numImage])
    }
}

