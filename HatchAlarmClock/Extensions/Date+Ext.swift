//
//  Date+Ext.swift
//  HatchAlarmClock
//
//  Created by Ryan Schefske on 12/9/25.
//

import Foundation

extension Date {
    func toTimeString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm a"
        return dateFormatter.string(from: self)
    }
    
    func toDateString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, YYYY"
        return dateFormatter.string(from: self)
    }
    
    func hours() -> Int {
        Calendar.current.component(.hour, from: self)
    }
    
    func minutes() -> Int {
        Calendar.current.component(.minute, from: self)
    }
}
