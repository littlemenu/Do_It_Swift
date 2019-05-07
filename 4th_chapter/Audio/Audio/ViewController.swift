//
//  ViewController.swift
//  Audio
//
//  Created by 정재훈 on 23/03/2019.
//  Copyright © 2019 정재훈. All rights reserved.
//

import UIKit
import AVFoundation
    
class ViewController: UIViewController, AVAudioPlayerDelegate, AVAudioRecorderDelegate {

    var audioPlayer: AVAudioPlayer!
    var audioRecorder: AVAudioRecorder!
    
    let timePlayerSelector: Selector = #selector(ViewController.updatePlayTime)
    let timeRecordSelector: Selector = #selector(ViewController.updateRecordTime)
    
    var audioFile: URL!
    let MAX_VOLUME: Float = 10.0
    var progressTimer: Timer!
    var isRecordMode = false
    
    let playImage = UIImage(named: "play.png")
    let pauseImage = UIImage(named: "pause.png")
    let stopImage = UIImage(named: "stop.png")
    let recordImage = UIImage(named: "record.png")
    
    @IBOutlet weak var pvProgressPlay: UIProgressView!
    @IBOutlet weak var lblCurrentTime: UILabel!
    @IBOutlet weak var lblEndTime: UILabel!
    @IBOutlet weak var btnPlay: UIButton!
    @IBOutlet weak var btnPause: UIButton!
    @IBOutlet weak var btnStop: UIButton!
    @IBOutlet weak var slVolume: UISlider!
    @IBOutlet weak var imgNow: UIImageView!
    @IBOutlet weak var btnRecord: UIButton!
    @IBOutlet weak var lblRecordTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        selectAudioFile()
        progressTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: timePlayerSelector, userInfo: nil, repeats: true)
        imgNow.image = stopImage
        
        if !isRecordMode {
            initPlay()
            btnRecord.isEnabled = false
            lblRecordTime.isEnabled = false
        } else {
            initRecord()
        }
    }
    
    // 재생 모드와 녹음 모드에 따라 다른 파일을 선택
    func selectAudioFile() {
        if !isRecordMode {
            audioFile = Bundle.main.url(forResource: "Sicilian_Breeze", withExtension: "mp3")
        } else {
            let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            audioFile = documentDirectory.appendingPathComponent("recordFile.m4a")
        }
    }
    
    // 재생 모드의 초기화
    func initPlay() {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audioFile)
        } catch let error as NSError {
            print("Error-initPlay : \(error)")
        }
        slVolume.maximumValue = MAX_VOLUME
        slVolume.value = 1.0
        pvProgressPlay.progress = 0
        
        audioPlayer.delegate = self
        audioPlayer.prepareToPlay()
        audioPlayer.volume = slVolume.value
        
        lblEndTime.text = convertNSTimeInterval2String(audioPlayer.duration)
        lblCurrentTime.text = convertNSTimeInterval2String(0)
        setPlayButtons(true, Pause: false, Stop: false)
    }
    
    // 녹음 모드의 초기화
    func initRecord() {
        let recordingSettings = [
            AVFormatIDKey: NSNumber(value: kAudioFormatAppleLossless as UInt32),
            AVEncoderAudioQualityKey: AVAudioQuality.max.rawValue,
            AVEncoderBitRateKey: 320000,
            AVNumberOfChannelsKey: 2,
            AVSampleRateKey: 44100.0] as [String: Any]
        do {
            audioRecorder = try AVAudioRecorder(url: audioFile, settings: recordingSettings)
        } catch let error as NSError {
            print("Error-initRecord : \(error)")
        }
        
        audioRecorder.delegate = self
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        
        slVolume.value = 1.0
        audioPlayer.volume = slVolume.value
        lblEndTime.text = convertNSTimeInterval2String(0)
        lblCurrentTime.text = convertNSTimeInterval2String(0)
        setPlayButtons(false, Pause: false, Stop: false)
        
        let session = AVAudioSession.sharedInstance()
        do {
            try session.setCategory(AVAudioSession.Category.playAndRecord)
        } catch let error as NSError {
            print("Error-setCategory: \(error)")
        }
        do {
            try session.setActive(true, options: .init())
        } catch let error as NSError {
            print("Error-setActive : \(error)")
        }
    }
    
    // [재생], [일시 정지], [정지] 버튼을 활성화 또는 비활성화하는 함수
    func setPlayButtons(_ play: Bool, Pause: Bool, Stop: Bool) {
        btnPlay.isEnabled = play
        btnPause.isEnabled = Pause
        btnStop.isEnabled = Stop
    }
    
    // 00:00 형태의 문자열로 변환
    func convertNSTimeInterval2String(_ time: TimeInterval) -> String {
        let min = Int(time/60)                                      // 재생 시간의 매개변수인 time 값을 60으로 나눈 몫을 정수 값으로 변환
        let sec = Int(time.truncatingRemainder(dividingBy: 60))     // time 값을 60으로 나눈 나머지 값을 정수 값으로 변환
        let strTime = String(format: "%02d:%02d", min, sec)
        return strTime
    }
    
    // 재생이 종료되었을 때 호출됨
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        progressTimer.invalidate()
        imgNow.image = stopImage
        setPlayButtons(true, Pause: false, Stop: false)
    }

    // [재생] 버튼을 클릭하였을 때
    @IBAction func btnPlayAudio(_ sender: UIButton) {
        audioPlayer.play()
        imgNow.image = playImage
        setPlayButtons(false, Pause: true, Stop: true)
    }
    
    // [일시 정지] 버튼을 클릭하였을 때
    @IBAction func btnPauseAudio(_ sender: UIButton) {
        audioPlayer.pause()
        imgNow.image = pauseImage
        setPlayButtons(true, Pause: false, Stop: true)
    }
    
    // [정지] 버튼을 클릭하였을 때
    @IBAction func btnStopAudio(_ sender: UIButton) {
        audioPlayer.stop()
        imgNow.image = stopImage
        setPlayButtons(true, Pause: true, Stop: false)
        audioPlayer.currentTime = 0
        lblCurrentTime.text = convertNSTimeInterval2String(0)
        progressTimer.invalidate()
        pvProgressPlay.progress = 0
    }
    
    // 볼륨 슬라이더 값을 audioplayer.volume에 대입
    @IBAction func slChangeVolume(_ sender: UISlider) {
        audioPlayer.volume = slVolume.value
    }
    
    // 스위치 On/Off에 따라 재생 모드, 녹음 모드 구분
    @IBAction func swRecordMode(_ sender: UISwitch) {
        if sender.isOn {    // 녹음 모드일 때
            audioPlayer.stop()
            audioPlayer.currentTime = 0
            lblRecordTime!.text = convertNSTimeInterval2String(0)
            isRecordMode = true
            btnRecord.isEnabled = true
            lblRecordTime.isEnabled = true
        } else {            // 재생 모드일 때
            isRecordMode = false
            audioRecorder.stop()
            btnRecord.setTitle("Record", for: .normal)
            btnRecord.isEnabled = false
            lblRecordTime.isEnabled = false
            lblRecordTime.text = convertNSTimeInterval2String(0)
        }
        selectAudioFile()
        if !isRecordMode {
            initPlay()
        } else {
            initRecord()
        }
        imgNow.image = stopImage
    }
    
    @IBAction func btnRecord(_ sender: UIButton) {
        if sender.titleLabel?.text == "Record" {    //버튼이 "Record"일 때 녹음을 중지
            audioRecorder.record()
            sender.setTitle("Stop", for: UIControl.State())
            imgNow.image = recordImage
            progressTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: timeRecordSelector, userInfo: nil, repeats: true)
        } else {    // 버튼이 "Stop"일 때 녹음을 위한 초기화를 수정
            audioRecorder.stop()
            sender.setTitle("Record", for: UIControl.State())
            imgNow.image = stopImage
            btnPlay.isEnabled = true
            initPlay()
        }
    }
    
    // 0.1초마다 호출되어 시간 변경
    @objc func updatePlayTime() {
        lblCurrentTime.text = convertNSTimeInterval2String(audioPlayer.currentTime)
        pvProgressPlay.progress = Float(audioPlayer.currentTime / audioPlayer.duration)
    }
    @objc func updateRecordTime() {
        lblRecordTime.text = convertNSTimeInterval2String(audioRecorder.currentTime)
    }
}

