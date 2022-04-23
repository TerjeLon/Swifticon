//
//  SupportedPlatform.swift
//
//
//  Created by Terje Lønøy on 16/04/2022.
//

import UIKit

public enum SupportedPlatform: CaseIterable {
    case iPhone
    case iPad
    case iOSMarketing
    case macOS
    
    var targets: [Target] {
        switch self {
        case .iPhone:
            return [
                Target(size: 20, idiom: self.idiom, scales: [.x2, .x3]),
                Target(size: 29, idiom: self.idiom, scales: [.x1, .x2, .x3]),
                Target(size: 40, idiom: self.idiom, scales: [.x2, .x3]),
                Target(size: 57, idiom: self.idiom, scales: [.x1, .x2]),
                Target(size: 60, idiom: self.idiom, scales: [.x2, .x3])
            ]
        case .iPad:
            return [
                Target(size: 20, idiom: self.idiom, scales: [.x1, .x2]),
                Target(size: 29, idiom: self.idiom, scales: [.x1, .x2]),
                Target(size: 40, idiom: self.idiom, scales: [.x1, .x2]),
                Target(size: 50, idiom: self.idiom, scales: [.x1, .x2]),
                Target(size: 72, idiom: self.idiom, scales: [.x1, .x2]),
                Target(size: 76, idiom: self.idiom, scales: [.x1, .x2]),
                Target(size: 83.5, idiom: self.idiom, scales: [.x2]),
            ]
        case .iOSMarketing:
            return [
                Target(size: 1024, idiom: self.idiom, scales: [.x1])
            ]
        case .macOS:
            return [
                Target(size: 16, idiom: self.idiom, scales: [.x1, .x2]),
                Target(size: 32, idiom: self.idiom, scales: [.x1, .x2]),
                Target(size: 128, idiom: self.idiom, scales: [.x1, .x2]),
                Target(size: 256, idiom: self.idiom, scales: [.x1, .x2]),
                Target(size: 512, idiom: self.idiom, scales: [.x1, .x2]),
            ]
        }
    }
    
    var idiom: String {
        switch self {
        case .iPhone:
            return "iphone"
        case .iPad:
            return "ipad"
        case .iOSMarketing:
            return "ios-marketing"
        case .macOS:
            return "mac"
        }
    }
}
