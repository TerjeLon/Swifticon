//
//  Scale.swift
//  
//
//  Created by Terje Lønøy on 16/04/2022.
//

import UIKit

enum Scale {
    case x1
    case x2
    case x3
    
    var multiplier: CGFloat {
        switch self {
        case .x1:
            return 1
        case .x2:
            return 2
        case .x3:
            return 3
        }
    }
}
