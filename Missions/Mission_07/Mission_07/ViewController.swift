//
//  ViewController.swift
//  Mission_07
//
//  Created by 정재훈 on 01/04/2019.
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
        
        setPageControl(pageNumber: 0)
        pageControl.numberOfPages = images.count
        swapeGesture()
        
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(ViewController.doPinch(_:)))
        self.view.addGestureRecognizer(pinch)
    }
    
    func setPageControl(pageNumber: Int) {
        pageControl.currentPage = pageNumber
        imgView.image = UIImage(named: images[pageControl.currentPage])
    }
    
    func swapeGesture() {
        let swapeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwapeGesture(_:)))
        let swapeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwapeGesture(_:)))
        
        swapeLeft.direction = UISwipeGestureRecognizer.Direction.left
        swapeRight.direction = UISwipeGestureRecognizer.Direction.right
        
        self.view.addGestureRecognizer(swapeLeft)
        self.view.addGestureRecognizer(swapeRight)
    }
    
    @objc func respondToSwapeGesture(_ gesture: UIGestureRecognizer) {
        if let swapeGesture = gesture as? UISwipeGestureRecognizer {
            
            switch swapeGesture.direction {
            
            case UISwipeGestureRecognizer.Direction.left:
                if (pageControl.currentPage != images.count) {
                    setPageControl(pageNumber: pageControl.currentPage + 1)
                }
                
            case UISwipeGestureRecognizer.Direction.right:
                if (pageControl.currentPage != 0) {
                    setPageControl(pageNumber: pageControl.currentPage - 1)
                }
                
            default:
                break
            }
        }
    }
    
    @objc func doPinch(_ pinch: UIPinchGestureRecognizer) {
        imgView.transform = imgView.transform.scaledBy(x: pinch.scale, y: pinch.scale)
        pinch.scale = 1
    }
    
    @IBAction func pageChanged(_ sender: UIPageControl) {
        imgView.image = UIImage(named: images[pageControl.currentPage])
    }
}
