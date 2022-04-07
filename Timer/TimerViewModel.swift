//
//  TimerViewModel.swift
//  Timer
//
//  Created by Keshav on 06/04/22.
//



import UIKit

class TimerViewModel {
    
    var seconds = 0
    var timer = Timer()
    static let shared = TimerViewModel()
      
    ///timer action
    @objc func timerAction(){
        seconds += 1
        let seconds = seconds
        var mins = 0
        var secs = seconds
        if seconds >= 60 {
                    mins = Int(seconds / 60)
                    secs = seconds - (mins * 60)
            debugPrint("time is :- \(mins): \(secs)")
        }else{
            debugPrint("time is :- \(seconds)")
        }
        NotificationCenter.default.post(name: Notification.Name("NotificationIdentifier"), object: nil, userInfo: ["minutes":mins,"second":secs])
    }
    
    ///func to start timer
    func startTimer(){
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }
    
   ///reset timer
    func resetTimer(){
        timer.invalidate()
        seconds = 0
    }
    
    ///func to pause timer
    func pauseTimer(){
        timer.invalidate()
    }
    
    ///func for resume timer
    func resumeTimer(){
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }
    
}
