//
//  ViewController.swift
//  PageView
//
//  Created by 정재훈 on 19/03/2019.
//  Copyright © 2019 정재훈. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    let imageList = ["01.png", "02.png", "03.png", "04.png", "05.png"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setpageControl()
    }
    
    func setpageControl() {
        imageView.image = UIImage(named: imageList[0])
        pageControl.numberOfPages = imageList.count
        pageControl.currentPage = 0
    }
    
    @IBAction func pageChange(_ sender: UIPageControl) {
        imageView.image = UIImage(named: imageList[pageControl.currentPage])
    }
}
