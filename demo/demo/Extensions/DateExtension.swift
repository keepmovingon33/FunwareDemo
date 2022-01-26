//
//  DateExtension.swift
//  demo
//
//  Created by Sky on 23/01/2022.
//

import Foundation

extension Date {
    func toString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, yyyy 'at' hh:mm a"
        dateFormatter.locale = .current
        dateFormatter.timeZone = .current
        return dateFormatter.string(from: self)
    }
}
