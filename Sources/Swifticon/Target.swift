//
//  Target.swift
//
//
//  Created by Terje Lønøy on 16/04/2022.
//

import UIKit

struct Target {
    let id = UUID()
    let size: CGFloat
    let idiom: String
    let scales: [Scale]
    
    var folder: String?
    
    var sizeString: String {
        return "\(size)x\(size)"
    }
    
    var outputSizes: [OutputSize] {
        return scales.map { OutputSize(originalSize: size, scale: $0) }
    }

}