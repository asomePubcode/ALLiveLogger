//
//  File.swift
//  Logger-iphone
//
//  Created by 廖亚雄 on 2019/8/12.
//  Copyright © 2019 廖亚雄. All rights reserved.
//

import Foundation
import XCGLogger
import ALLiveLogger

open class TestLogger: NSObject,LogFormatterProtocol {
    public func format(logDetails: inout LogDetails, message: inout String) -> String {
        ALLiveLogger.al_log(toWeb: message)
        return message
    }
    
    var logger = XCGLogger.init()
    
    override init() {
        super.init()
        self.logger.formatters = [self]
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector:#selector(loggg), userInfo: nil, repeats: true)
    }
    
    @objc func loggg() -> () {
        self.logger.logln(Date.init())
    }
}
