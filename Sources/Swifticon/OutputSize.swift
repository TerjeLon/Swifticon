//
//  OutputSize.swift
//  
//
//  Created by Terje Lønøy on 16/04/2022.
//

import UIKit

struct OutputSize {
    let originalSize: CGFloat
    let scale: Scale
    
    var actualSize: CGFloat {
        return originalSize * scale.multiplier
    }
    
    var name: String {
        return "\(originalSize)@\(scale.multiplier)"
    }
}
