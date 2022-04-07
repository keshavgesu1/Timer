//
//  ViewController.swift
//  Timer
//
//  Created by Keshav on 06/04/22.
//

import UIKit

class ViewController: UIViewController,sendingTimerData {
    
    func data(hour: (Int), minutes: Int, second: Int) {
        
    }
    
    
    @IBOutlet weak var minLabel: UILabel!
    @IBOutlet weak var hoursLabel: UILabel!
    ///label to show timer
    @IBOutlet weak var secondTimerLabel: UILabel!
    
    ///stackView to hold reset&stop button  and pause button
    @IBOutlet weak var stackView: UIStackView!
    
    ///start button outlet
    @IBOutlet weak var startButton: UIButton!
    
    ///pause button outlet
    @IBOutlet weak var pauseButton: UIButton!
    
    ///reset or stop button outlet
    @IBOutlet weak var resetStopButton: UIButton!
    var counter = 0
    var timer = Timer()
    var starTimer = String()
    var minutes = 0
    var hours = 0
    
    //MARK: - VIEWCONTROLLER LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        pauseButton.isSelected = false
        stackView.isHidden = false
        pauseButton.isHidden = true
        resetStopButton.isHidden = true
        
    }
    
    ///button action to pause/resume timer
    @IBAction func pauseButtonAction(_ sender: UIButton) {
        if pauseButton.isSelected == false{
            pauseButton.isSelected = true
            pauseButton.setTitle("resume", for: .normal)
            timer.invalidate()
        }else{
            pauseButton.isSelected = false
            pauseButton.setTitle("pause", for: .normal)
            timer.invalidate()
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        }
    }
    
    ///button action to reset timer
    @IBAction func resetActionButton(_ sender: Any) {
        pauseButton.isHidden = true
        resetStopButton.isHidden = true
        startButton.isHidden = false
        timer.invalidate()
        counter = 0
    }
    
    ///button action to start timer
    @IBAction func startButtonAction(_ sender: UIButton) {
        startButton.isHidden = true
        pauseButton.isHidden = false
        resetStopButton.isHidden = false
       
        
        
        
//        timer.invalidate()
//        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(TimerViewModel.shared.timerAction), userInfo: nil, repeats: true)
    }
    
    ///func to handle timeraction
    @objc func timerAction(){
        counter += 1
        secondTimerLabel.text = "\(counter)"
        let seconds = counter
        var mins = 0
        var secs = seconds
        if seconds >= 60 {
                    mins = Int(seconds / 60)
                    secs = seconds - (mins * 60)
            debugPrint("time is :- \(mins): \(secs)")
            minLabel.text = "\(mins)"
            secondTimerLabel.text = "\(secs)"
        }else{
            debugPrint("time is :- \(counter)")
        }
    }
}
