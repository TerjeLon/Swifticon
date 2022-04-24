//
//  Target.swift
//
//
//  Created by Terje Lønøy on 16/04/2022.
//

import UIKit

struct Target {
    let size: CGFloat
    let idiom: String
    let scales: [Scale]
    let role: String?
    let subtype: String?
    
    var sizeString: String {
        let s = size.toString()
        return "\(s)x\(s)"
    }
    
    var outputSizes: [OutputSize] {
        return scales.map { OutputSize(originalSize: size, scale: $0) }
    }
    
    init(
        size: CGFloat,
        idiom: String,
        scales: [Scale],
        role: String? = nil,
        subtype: String? = nil
    ) {
        self.size = size
        self.idiom = idiom
        self.scales = scales
        self.role = role
        self.subtype = subtype
    }
}
