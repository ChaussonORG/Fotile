//
//  Timer+Extension.swift
//  Lebao
//
//  Created by 黑眼圈 on 2017/4/17.
//  Copyright © 2017年 Gjt. All rights reserved.
//
//
//  防止Timer 不被释放

import UIKit

public typealias TimerExcuteClosure = @convention(block) () -> ()

extension Timer {
    private class TimerActionBlockWrapper : NSObject {
        var block : TimerExcuteClosure
        init(block: @escaping TimerExcuteClosure) {
            self.block = block
        }
    }
    
    public class func lbScheduledTimerWithTimeInterval(_ ti:TimeInterval, closure: @escaping TimerExcuteClosure, repeats yesOrNo: Bool) -> Timer {
        return self.scheduledTimer(timeInterval: ti, target: self, selector: #selector(Timer.excuteTimerClosure(_:)), userInfo: TimerActionBlockWrapper(block: closure), repeats: true)
    }
    
    @objc private class func excuteTimerClosure(_ timer: Timer) {
        if let action = timer.userInfo as? TimerActionBlockWrapper {
            action.block()
        }
    }
}

