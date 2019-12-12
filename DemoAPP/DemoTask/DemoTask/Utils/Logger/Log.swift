//
//  Log.swift
//  DemoTask
//
//  Created by Bhupesh on 11/12/19.
//  Copyright © 2019 Bhupesh. All rights reserved.
//

import Foundation
import os

struct Log {
    private static let subsystem = Bundle.main.bundleIdentifier!
    private static let appLog = OSLog(subsystem: Log.subsystem, category: "Default")
    
    static func error(_ msg: String, error: Error? = nil, log: OSLog = appLog) {
        os_log("🔥 - %@ %@", log: log, type: .error, msg, error?.localizedDescription ?? "")
    }
    
    static func info(_ msg: String, log: OSLog = appLog) {
        os_log("🚀 - %@", log: log, type: .info, msg)
    }
    
    static func debug(_ msg: String, log: OSLog = appLog) {
        os_log("👀 - %@", log: log, type: .debug, msg)
    }
}
