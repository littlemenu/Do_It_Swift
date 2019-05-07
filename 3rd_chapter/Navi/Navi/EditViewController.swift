//
//  EditViewController.swift
//  Navi
//
//  Created by 정재훈 on 22/03/2019.
//  Copyright © 2019 정재훈. All rights reserved.
//

import UIKit

protocol EditDelegate {
    func didMessageEditDone(_ controller: EditViewController, message: String)
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool)
    func didImageZoomdone(_ controller: EditViewController, isZoom: Bool)
}

class EditViewController: UIViewController {

    var textWayValue: String = ""
    var textMessage: String = ""
    var isOn = false
    var isZoom = false
    var delegate: EditDelegate?
    
    @IBOutlet weak var lblWay: UILabel!
    @IBOutlet weak var lblIsOn: UILabel!
    @IBOutlet weak var txEditMessage: UITextField!
    @IBOutlet weak var swIsOn: UISwitch!
    @IBOutlet weak var btnImageResize: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        txEditMessage.text = textMessage
        lblWay.text = textWayValue
        swIsOn.isOn = isOn
        
        if isZoom {
            btnImageResize.setTitle("Zoom out", for: .normal)
        } else {
            btnImageResize.setTitle("Zoom in", for: .normal)
        }
        
        if isOn {
            lblIsOn.text = "On"
        } else {
            lblIsOn.text = "Off"
        }
    }
    
    @IBAction func swImageOnOff(_ sender: UISwitch) {
        if sender.isOn {
            lblIsOn.text = "On"
        } else {
            lblIsOn.text = "Off"
        }
        isOn = !isOn
    }
    
    @IBAction func btnImageZoom(_ sender: UIButton) {
        if isZoom {
            btnImageResize.setTitle("Zoom in", for: .normal)
        } else {
            btnImageResize.setTitle("Zoom out", for: .normal)
        }
        isZoom = !isZoom
    }
    
    @IBAction func btnDone(_ sender: UIButton) {
        if delegate != nil {
            delegate?.didMessageEditDone(self, message: txEditMessage.text!)
            delegate?.didImageZoomdone(self, isZoom: isZoom)
            delegate?.didImageOnOffDone(self, isOn: isOn)
        }
        
        _ = navigationController?.popViewController(animated: true)
    }
}
