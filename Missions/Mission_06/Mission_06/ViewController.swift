//
//  ViewController.swift
//  Mission_06
//
//  Created by 정재훈 on 31/03/2019.
//  Copyright © 2019 정재훈. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let images = ["01.png", "02.png", "03.png", "04.png", "05.png", "06.png"]
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        pageControl.numberOfPages = images.count
        setPageControl(pageNumber: 0)
        setSwipeGesture()
    }
    
    func setPageControl(pageNumber: Int) {
        pageControl.currentPage = pageNumber
        imgView.image = UIImage(named: images[pageNumber])
    }

    func setSwipeGesture() {
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        
        self.view.addGestureRecognizer(swipeLeft)
        self.view.addGestureRecognizer(swipeRight)
    }
    
    @IBAction func pageChanged(_ sender: UIPageControl) {
        imgView.image = UIImage(named: images[pageControl.currentPage])
    }
    
    @objc func respondToSwipeGesture(_ gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.right:
                if (pageControl.currentPage != 0) {
                    setPageControl(pageNumber: pageControl.currentPage - 1)
                }
        
            case UISwipeGestureRecognizer.Direction.left:
                if (pageControl.currentPage != 5) {
                    setPageControl(pageNumber: pageControl.currentPage + 1)
                }
                
            default:
                break
            }
        }
    }
}

