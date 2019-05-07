//
//  ViewController.swift
//  SwipeGesture
//
//  Created by 정재훈 on 31/03/2019.
//  Copyright © 2019 정재훈. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let numOfTouchs = 2
    
    var imgUp = [UIImage]()
    var imgDown = [UIImage]()
    var imgLeft = [UIImage]()
    var imgRight = [UIImage]()
    
    @IBOutlet weak var imgViewUp: UIImageView!
    @IBOutlet weak var imgViewDown: UIImageView!
    @IBOutlet weak var imgViewLeft: UIImageView!
    @IBOutlet weak var imgViewRight: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setImages()
        swipeGestureSet()
    }

    func setImages() {
        // UP Button Images
        imgUp.append(UIImage(named: "arrow-up-black.png")!)
        imgUp.append(UIImage(named: "arrow-up-red.png")!)
        imgUp.append(UIImage(named: "arrow-up-green.png")!)
        
        // Down Button Images
        imgDown.append(UIImage(named: "arrow-down-black.png")!)
        imgDown.append(UIImage(named: "arrow-down-red.png")!)
        imgDown.append(UIImage(named: "arrow-down-green.png")!)
        
        // Left Button Images
        imgLeft.append(UIImage(named: "arrow-left-black.png")!)
        imgLeft.append(UIImage(named: "arrow-left-red.png")!)
        imgLeft.append(UIImage(named: "arrow-left-green.png")!)
        
        // Right Button Images
        imgRight.append(UIImage(named: "arrow-right-black.png")!)
        imgRight.append(UIImage(named: "arrow-right-red.png")!)
        imgRight.append(UIImage(named: "arrow-right-green.png")!)
        
        // Show Arrow Images
        imgViewUp.image = imgUp[0]
        imgViewDown.image = imgDown[0]
        imgViewLeft.image = imgLeft[0]
        imgViewRight.image = imgRight[0]
    }
    
    func swipeGestureSet() {
        // Requir One Touch
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        
        swipeUp.direction = UISwipeGestureRecognizer.Direction.up
        swipeDown.direction = UISwipeGestureRecognizer.Direction.down
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        
        // swipeUp.numberOfTouchesRequired = numOfTouchs
        // swipeDown.numberOfTouchesRequired = numOfTouchs
        // swipeLeft.numberOfTouchesRequired = numOfTouchs
        // swipeRight.numberOfTouchesRequired = numOfTouchs
        
        self.view.addGestureRecognizer(swipeUp)
        self.view.addGestureRecognizer(swipeDown)
        self.view.addGestureRecognizer(swipeLeft)
        self.view.addGestureRecognizer(swipeRight)
        
        // Requir Two Touches
        let swipeUpMulti = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGestureMulti(_:)))
        let swipeDownMulti = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGestureMulti(_:)))
        let swipeLeftMulti = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGestureMulti(_:)))
        let swipeRightMulti = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGestureMulti(_:)))
        
        swipeUpMulti.direction = UISwipeGestureRecognizer.Direction.up
        swipeDownMulti.direction = UISwipeGestureRecognizer.Direction.down
        swipeLeftMulti.direction = UISwipeGestureRecognizer.Direction.left
        swipeRightMulti.direction = UISwipeGestureRecognizer.Direction.right
        
        swipeUpMulti.numberOfTouchesRequired = numOfTouchs
        swipeDownMulti.numberOfTouchesRequired = numOfTouchs
        swipeLeftMulti.numberOfTouchesRequired = numOfTouchs
        swipeRightMulti.numberOfTouchesRequired = numOfTouchs
        
        self.view.addGestureRecognizer(swipeUpMulti)
        self.view.addGestureRecognizer(swipeDownMulti)
        self.view.addGestureRecognizer(swipeLeftMulti)
        self.view.addGestureRecognizer(swipeRightMulti)
    }
    
    @objc func respondToSwipeGesture(_ gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            imgViewUp.image = imgUp[0]
            imgViewDown.image = imgDown[0]
            imgViewLeft.image = imgLeft[0]
            imgViewRight.image = imgRight[0]
            
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.up:
                imgViewUp.image = imgUp[1]
                
            case UISwipeGestureRecognizer.Direction.down:
                imgViewDown.image = imgDown[1]
                
            case UISwipeGestureRecognizer.Direction.left:
                imgViewLeft.image = imgLeft[1]
                
            case UISwipeGestureRecognizer.Direction.right:
                imgViewRight.image = imgRight[1]
            
            default:
                break
            }
        }
    }
    
    @objc func respondToSwipeGestureMulti(_ gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            imgViewUp.image = imgUp[0]
            imgViewDown.image = imgDown[0]
            imgViewLeft.image = imgLeft[0]
            imgViewRight.image = imgRight[0]
            
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.up:
                imgViewUp.image = imgUp[2]
                
            case UISwipeGestureRecognizer.Direction.down:
                imgViewDown.image = imgDown[2]
                
            case UISwipeGestureRecognizer.Direction.left:
                imgViewLeft.image = imgLeft[2]
                
            case UISwipeGestureRecognizer.Direction.right:
                imgViewRight.image = imgRight[2]
                
            default:
                break
            }
        }
    }
}

