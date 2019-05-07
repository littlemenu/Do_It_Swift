//
//  ViewController.swift
//  Sketch
//
//  Created by 정재훈 on 30/03/2019.
//  Copyright © 2019 정재훈. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var lastPointer: CGPoint!
    var lineSize: CGFloat = 2.0
    var lineColor = UIColor.red.cgColor
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var txtFontSize: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnClearImageView(_ sender: UIButton) {
        imgView.image = nil
    }
    
    @IBAction func btnFontBlack(_ sender: UIButton) {
        lineColor = UIColor.black.cgColor
    }
    
    @IBAction func btnFontRed(_ sender: UIButton) {
        lineColor = UIColor.red.cgColor
    }
    
    @IBAction func btnFontGreen(_ sender: UIButton) {
        lineColor = UIColor.green.cgColor
    }
    
    @IBAction func btnFontBlue(_ sender: UIButton) {
        lineColor = UIColor.blue.cgColor
    }
    
    @IBAction func btnFontSize(_ sender: UIButton) {
        lineSize = CGFloat(Int(txtFontSize.text!)!)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch
        lastPointer = touch.location(in: imgView)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIGraphicsBeginImageContext(imgView.frame.size)
        UIGraphicsGetCurrentContext()?.setLineWidth(lineSize)
        UIGraphicsGetCurrentContext()?.setStrokeColor(lineColor)
        UIGraphicsGetCurrentContext()?.setLineCap(CGLineCap.round)
        
        let touch = touches.first! as UITouch
        let currentPointer = touch.location(in: imgView)
        
        imgView.image?.draw(in: CGRect(x: 0, y: 0, width: imgView.frame.width, height: imgView.frame.height))
        
        UIGraphicsGetCurrentContext()?.move(to: CGPoint(x: lastPointer.x, y: lastPointer.y))
        UIGraphicsGetCurrentContext()?.addLine(to: CGPoint(x: currentPointer.x, y: currentPointer.y))
        UIGraphicsGetCurrentContext()?.strokePath()
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        lastPointer = currentPointer
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIGraphicsBeginImageContext(imgView.frame.size)
        UIGraphicsGetCurrentContext()?.setLineWidth(lineSize)
        UIGraphicsGetCurrentContext()?.setStrokeColor(lineColor)
        UIGraphicsGetCurrentContext()?.setLineCap(CGLineCap.round)
        
        imgView.image?.draw(in: CGRect(x: 0, y: 0, width: imgView.frame.width, height: imgView.frame.height))
        
        UIGraphicsGetCurrentContext()?.move(to: CGPoint(x: lastPointer.x, y: lastPointer.y))
        UIGraphicsGetCurrentContext()?.addLine(to: CGPoint(x: lastPointer.x, y: lastPointer.y))
        UIGraphicsGetCurrentContext()?.strokePath()
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            imgView.image = nil
        }
    }
}
