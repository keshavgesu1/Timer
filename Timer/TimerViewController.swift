//
//  ViewController.swift
//  Timer
//
//  Created by Keshav on 06/04/22.
//

import UIKit

class TimerViewController: UIViewController {
    
    ///minlabel
    @IBOutlet weak var minLabel: UILabel!
    
    ///hours label
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
            TimerViewModel.shared.pauseTimer()
        }else{
            pauseButton.isSelected = false
            pauseButton.setTitle("pause", for: .normal)
            TimerViewModel.shared.resumeTimer()
        }
    }
    
    ///button action to reset timer
    @IBAction func resetActionButton(_ sender: Any) {
        pauseButton.isHidden = true
        resetStopButton.isHidden = true
        startButton.isHidden = false
        TimerViewModel.shared.resetTimer()
        NotificationCenter.default.removeObserver(self, name: Notification.Name("NotificationIdentifier"), object: nil)
        minLabel.text = "00"
        secondTimerLabel.text = "00"
    }
    
    ///button action to start timer
    @IBAction func startButtonAction(_ sender: UIButton) {
        startButton.isHidden = true
        pauseButton.isHidden = false
        resetStopButton.isHidden = false
        TimerViewModel.shared.startTimer()
        NotificationCenter.default.addObserver(self, selector: #selector(self.methodOfReceivedNotification(notification:)), name: Notification.Name("NotificationIdentifier"), object: nil)
    }
    
    ///get time using observer
    @objc func methodOfReceivedNotification(notification: Notification) {
        let object = notification.userInfo as? [String:Any]
        secondTimerLabel.text = "\(object?["second"] ?? "")"
        minLabel.text = "\(object?["minutes"] ?? "")"
    }

}
