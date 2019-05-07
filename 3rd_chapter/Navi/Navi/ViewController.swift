//
//  ViewController.swift
//  Navi
//
//  Created by 정재훈 on 22/03/2019.
//  Copyright © 2019 정재훈. All rights reserved.
//

import UIKit

class ViewController: UIViewController, EditDelegate {

    let imgOn = UIImage(named: "lamp-on.png")
    let imgOff = UIImage(named: "lamp-off.png")
    var isOn = false
    var isZoom = false
    var zoomed = 0
    
    @IBOutlet weak var txViewMessage: UITextField!
    @IBOutlet weak var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        imgView.image = imgOff
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editViewController  = segue.destination as! EditViewController
        
        if segue.identifier == "editButton" {
            editViewController.textWayValue = "segue: use editButton"
        } else if segue.identifier == "editBarButton" {
            editViewController.textWayValue = "segue: use editBarButton"
        }
        
        editViewController.textMessage = txViewMessage.text!
        editViewController.isOn = isOn
        editViewController.isZoom = isZoom
        editViewController.delegate = self
    }
    func didMessageEditDone(_ controller: EditViewController, message: String) {
        txViewMessage.text = message
    }
    
    func didImageZoomdone(_ controller: EditViewController, isZoom: Bool) {
        let scale: CGFloat = 2.0
        var newWidth: CGFloat = imgView.frame.width, newHeight: CGFloat = imgView.frame.height
        
        if (isZoom && zoomed == 0)  {
            self.isZoom = true
            self.zoomed = 1
            newWidth = newWidth * scale
            newHeight = newHeight * scale
            imgView.frame.size = CGSize(width: newWidth, height: newHeight)
            
        } else if (!isZoom && zoomed == 1) {
            self.isZoom = false
            self.zoomed = 0
            newWidth = newWidth / scale
            newHeight = newHeight / scale
            imgView.frame.size = CGSize(width: newWidth, height: newHeight
            )
        }
    }
    
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool) {
        if isOn {
            self.isOn = true
            imgView.image = imgOn
        } else {
            self.isOn = false
            imgView.image = imgOff
        }
    }
}
