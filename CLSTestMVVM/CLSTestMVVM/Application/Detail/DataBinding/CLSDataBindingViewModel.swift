//
//  CLSDataBindingViewModel.swift
//  CLSTestMVVM
//
//  Created by StephenChen on 18/04/2018.
//  Copyright © 2018 StephenChen. All rights reserved.
//

import Foundation

final class CLSDataBindingViewModel {
    
    fileprivate var timer: Timer?
    
    public var text = Dynamic<String>("")
    
    public var progressValue = Dynamic<Float>(0)
    
    init() {

    }
    
    func start() {
        timer = Timer.scheduledTimer(timeInterval: 0.3,
                                     target: self,
                                     selector: #selector(timerEvent),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    // Timer expects @objc selector
    @objc func timerEvent() {
        if (self.progressValue.value >= 1.0) {
            self.timer?.invalidate()
            return
        }
        self.progressValue.value = self.progressValue.value + Float(0.1)
        self.text.value = "\(self.progressValue.value * 10)"
    }
}
