//
//  CGFloat+clean.swift
//  
//
//  Created by Terje Lønøy on 23/04/2022.
//

import UIKit

extension CGFloat {
    func toString() -> String {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        formatter.numberStyle = .decimal
        
        return formatter
            .string(from: self as NSNumber)!
            .replacingOccurrences(of: ",", with: "")
    }
}
