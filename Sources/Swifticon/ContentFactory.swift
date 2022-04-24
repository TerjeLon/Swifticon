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
    let role: String?
    let subtype: String?
}

class ContentFactory {
    static func generateContentJson(fromPlatform platform: SupportedPlatform) throws -> Data {
        let info = ContentInfo(author: "Swifticon", version: 1)
        var iconInfo: [IconInfo] = []
        
        platform.targets.forEach { target in
            target.outputSizes.forEach { outputTarget in
                let o = IconInfo(
                    filename: "\(outputTarget.name).png",
                    idiom: target.idiom,
                    scale: outputTarget.scale.name,
                    size: target.sizeString,
                    role: target.role,
                    subtype: target.subtype
                )
                
                iconInfo.append(o)
            }
        }
        
        let content = Content(images: iconInfo, info: info)
        let coder = JSONEncoder()
        
        return try coder.encode(content)
    }
}
