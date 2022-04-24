//
//  SupportedPlatform.swift
//
//
//  Created by Terje Lønøy on 16/04/2022.
//

import UIKit

public enum SupportedPlatform {
    case iPhoneAndiPad(assetsFolderRelativePath: String)
    case iPhone(assetsFolderRelativePath: String)
    case iPad(assetsFolderRelativePath: String)
    case macOS(assetsFolderRelativePath: String)
    
    var targets: [Target] {
        switch self {
        case .iPhone:
            return [
                Target(size: 20, idiom: "iphone", scales: [.x2, .x3]),
                Target(size: 29, idiom: "iphone", scales: [.x1, .x2, .x3]),
                Target(size: 40, idiom: "iphone", scales: [.x2, .x3]),
                Target(size: 57, idiom: "iphone", scales: [.x1, .x2]),
                Target(size: 60, idiom: "iphone", scales: [.x2, .x3]),
                Target(size: 1024, idiom: "ios-marketing", scales: [.x1])
            ]
        case .iPad:
            return [
                Target(size: 20, idiom: "ipad", scales: [.x1, .x2]),
                Target(size: 29, idiom: "ipad", scales: [.x1, .x2]),
                Target(size: 40, idiom: "ipad", scales: [.x1, .x2]),
                Target(size: 50, idiom: "ipad", scales: [.x1, .x2]),
                Target(size: 72, idiom: "ipad", scales: [.x1, .x2]),
                Target(size: 76, idiom: "ipad", scales: [.x1, .x2]),
                Target(size: 83.5, idiom: "ipad", scales: [.x2]),
            ]
        case .iPhoneAndiPad:
            return SupportedPlatform.iPhone(assetsFolderRelativePath: "").targets + SupportedPlatform.iPad(assetsFolderRelativePath: "").targets
        case .macOS:
            return [
                Target(size: 16, idiom: "mac", scales: [.x1, .x2]),
                Target(size: 32, idiom: "mac", scales: [.x1, .x2]),
                Target(size: 128, idiom: "mac", scales: [.x1, .x2]),
                Target(size: 256, idiom: "mac", scales: [.x1, .x2]),
                Target(size: 512, idiom: "mac", scales: [.x1, .x2]),
            ]
        }
    }
    
    var assetsFolderRelativePath: String {
        switch self {
        case .iPhone(let assetsFolderRelativePath),
            .iPad(let assetsFolderRelativePath),
            .iPhoneAndiPad(let assetsFolderRelativePath),
            .macOS(let assetsFolderRelativePath):
            return assetsFolderRelativePath
        }
    }
}
