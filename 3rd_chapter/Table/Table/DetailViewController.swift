//
//  DetailViewController.swift
//  Table
//
//  Created by 정재훈 on 22/03/2019.
//  Copyright © 2019 정재훈. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var receiveItem = ""
    
    @IBOutlet weak var lblItemView: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        lblItemView.text = receiveItem
    }
    
    // Main View에서 변수를 받아오기 위한 함수
    func receiveItem(_ item: String) {
        receiveItem = item
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
