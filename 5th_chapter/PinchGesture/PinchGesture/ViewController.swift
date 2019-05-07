//
//  ViewController.swift
//  PinchGesture
//
//  Created by 정재훈 on 01/04/2019.
//  Copyright © 2019 정재훈. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // var initialFontSize: CGFloat!
    
    @IBOutlet weak var imgView: UIImageView!
    // @IBOutlet weak var txtPinch: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(ViewController.doPinch(_:)))
        self.view.addGestureRecognizer(pinch)
    }
    
    @objc func doPinch(_ pinch: UIPinchGestureRecognizer) {
//        if (pinch.state == UIPinchGestureRecognizer.State.began) {
//            initialFontSize = txtPinch.font.pointSize
//        } else {
//            txtPinch.font = txtPinch.font.withSize(initialFontSize * pinch.scale)
//        }
        
        imgView.transform = imgView.transform.scaledBy(x: pinch.scale, y: pinch.scale)
        pinch.scale = 1
    }
}

