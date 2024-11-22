//
//  Item.swift
//  SampleApp
//
//  Created by Ejay Torres on 11/21/24.
//

import Foundation
import SwiftData

@Model
final class Log {
    var buttonName: String
    var timestamp: Date
    
    init(buttonName: String, timestamp: Date = .now) {
        self.buttonName = buttonName
        self.timestamp = timestamp
    }
}
