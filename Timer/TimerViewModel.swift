//
//  TimerViewModel.swift
//  Timer
//
//  Created by Keshav on 06/04/22.
//

protocol sendingTimerData {
    func data(hour:(Int),minutes:Int,second:Int)
}


import UIKit

class TimerViewModel {
    
    var seconds = 0
    var timer = Timer()
    var starTimer = String()
    var minutes = 0
    var hours = 0
    static let shared = TimerViewModel()
    var hourString = ""
    var minString = ""
    var secondString = ""
    var delegate: sendingTimerData?
    
    ///timer action
    @objc func timerAction(){
        seconds += 1
        let seconds = seconds
        var mins = 0
        var secs = seconds
        if seconds >= 60 {
                    mins = Int(seconds / 60)
                    secs = seconds - (mins * 60)
            delegate?.data(hour: 0, minutes: (mins), second: secs)
            debugPrint("time is :- \(mins): \(secs)")
        }else{
            debugPrint("time is :- \(seconds)")
        }
    }
    
    func startTimer(){
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }
    
   ///reset timer
    func resetTimer(){
        timer.invalidate()
        seconds = 0
    }
    
    
}
