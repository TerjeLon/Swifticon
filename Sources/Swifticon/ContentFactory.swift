//
//  ContentFactory.swift
//  
//
//  Created by Terje Lønøy on 23/04/2022.
//

import Foundation

struct Content: Codable {
    let images: [IconInfo]
    let info: ContentInfo
}

struct ContentInfo: Codable {
    let author: String
    let version: Int
}

struct IconInfo: Codable {
    let filename: String
    let idiom: String
    let scale: String
    let size: String
}

class ContentFactory {
    static func generateContentJson(fromPlatforms platforms: [SupportedPlatform]) throws -> Data {
        let info = ContentInfo(author: "Swifticon", version: 1)
        var iconInfo: [IconInfo] = []
        
        platforms.forEach { platform in
            platform.targets.forEach { target in
                target.outputSizes.forEach { outputTarget in
                    let o = IconInfo(
                        filename: "\(outputTarget.name).png",
                        idiom: platform.idiom,
                        scale: outputTarget.scale.name,
                        size: target.sizeString
                    )
                    
                    iconInfo.append(o)
                }
            }
        }
        
        
        let content = Content(images: iconInfo, info: info)
        let coder = JSONEncoder()
        
        return try coder.encode(content)
    }
}
