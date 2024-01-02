//
//  SettingsOptionsViewModel.swift
//  MessengerTutorial
//
//  Created by user on 02/01/24.
//

import Foundation
import SwiftUI

enum SettingsOptionsViewModel: Int, CaseIterable, Identifiable {
    case darkmode
    case activeStatus
    case accessibility
    case privacy
    case notifications
    
    var title: String {
        switch self {
        case .darkmode: return "Dark Mode"
        case .activeStatus: return "Active Status"
        case .accessibility: return "Accessibility"
        case .privacy: return "Privacy"
        case .notifications: return "Notifications"
        }
    }
    
    var image: String {
        switch self {
        case .darkmode: return "moon.circle.fill"
        case .activeStatus: return "message.badge.circle.fill"
        case .accessibility: return "person.circle.fill"
        case .privacy: return "lock.circle.fill"
        case .notifications: return "bell.circle.fill"
        }
    }
    
    var imageBacgroundColor: Color {
        switch self {
        case .darkmode: return .black
        case .activeStatus: return .green
        case .accessibility: return .black
        case .privacy: return .blue
        case .notifications: return .purple
        }
    }
    
    var id: Int { return self.rawValue }
}
