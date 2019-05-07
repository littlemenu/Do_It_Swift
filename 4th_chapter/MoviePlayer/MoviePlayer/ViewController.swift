//
//  ViewController.swift
//  MoviePlayer
//
//  Created by 정재훈 on 27/03/2019.
//  Copyright © 2019 정재훈. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController {
   
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnPlayInternalMovie(_ sender: UIButton) {
        // 비디오 파일명을 사용하여 비디오가 저장된 앱 내부의 파일 경로를 받아옴
        let filePath: String? = Bundle.main.path(forResource: "FastTyping", ofType: "mp4")
        
        // 앱 내부의 파일명을 NSURL 형식으로 변경
        let url = NSURL(fileURLWithPath: filePath!)
        
        playVideo(url: url)
    }
    
    @IBAction func btnPlayExternalMovie(_ sender: UIButton) {
        // 외부에 링크된 주소를 NSURL 형식으로 변경
        let url = NSURL(string: "https://www.youtube.com/watch?v=lO5nnP5b6_4")!
        
        playVideo(url: url)
    }
    
    private func playVideo(url: NSURL) {
        // AVPlayerViewController의 인스턴스 생성
        let playerController = AVPlayerViewController()
        
        // 비디오 URL로 초기화된 AVPlayer의 인스턴스 생성
        let player = AVPlayer(url: url as URL)
        
        // AVPlayerViewController의 player 속성에 위에서 생성한 AVPlayer 인스턴스 항당
        playerController.player = player
        
        self.present(playerController, animated: true) {
            player.play() // 비디오 재생
        }
    }
}
