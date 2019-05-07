//
//  AddViewController.swift
//  Table
//
//  Created by 정재훈 on 22/03/2019.
//  Copyright © 2019 정재훈. All rights reserved.
//

import UIKit

class AddViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    let PICKER_VIEW_COMPONENT = 1
    var pickedImage: String = "clock.png"
    
    @IBOutlet weak var tfAddItem: UITextField!
    @IBOutlet weak var pickerViewIcon: UIPickerView!
    @IBOutlet weak var imgSelectedView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // 새 목록 추가 함수
    @IBAction func btnAddItem(_ sender: UIButton) {
        items.append(tfAddItem.text!)
        itemsImageFile.append(pickedImage)
        tfAddItem.text = ""
        _ = navigationController?.popViewController(animated: true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PICKER_VIEW_COMPONENT
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return itemsImageFile.count
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let imageView = UIImageView(image: UIImage(named: itemsImageFile[row]))
        imageView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        return imageView
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        imgSelectedView.image = UIImage(named: itemsImageFile[row])
        pickedImage = itemsImageFile[row]
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
