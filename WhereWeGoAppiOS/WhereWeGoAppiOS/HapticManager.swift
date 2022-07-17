//
//  HapticManager.swift
//  WhereWeGoAppiOS
//
//  Created by fonztara on 16/07/22.
//

import Foundation
import UIKit
import SwiftUI

class HapticManager {
    static let instance = HapticManager()
    
    
    func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
    
    func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
    
}
