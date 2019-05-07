//
//  ImageViewController.swift
//  Tab
//
//  Created by 정재훈 on 20/03/2019.
//  Copyright © 2019 정재훈. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
    
    var isZoom = false
    let imgOn = UIImage(named: "lamp_on.png")
    let imgOff = UIImage(named: "lamp_off.png")

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var btnResize: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imageView.image = imgOn
    }
    @IBAction func btnResizeImage(_ sender: UIButton) {
        
        let scale: CGFloat = 2.0
        var newWidth: CGFloat = imageView.frame.width
        var newHeight: CGFloat = imageView.frame.height
        
        if isZoom {
            btnResize.setTitle("확대", for: .normal)
            newWidth = newWidth / scale
            newHeight = newHeight / scale
            
        } else {
            btnResize.setTitle("축소", for: .normal)
            newWidth = newWidth * scale
            newHeight = newHeight * scale
        }
        imageView.frame.size = CGSize(width: newWidth, height: newHeight)
        isZoom = !isZoom
    }
    
    @IBAction func switchImageOnOff(_ sender: UISwitch) {
        if sender.isOn {
            imageView.image = imgOn
        } else {
            imageView.image = imgOff
        }
    }
}
