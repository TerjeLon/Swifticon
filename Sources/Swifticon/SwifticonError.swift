//
//  SwifticonError.swift
//  
//
//  Created by Terje Lønøy on 18/04/2022.
//

import Foundation

enum SwifticonError: LocalizedError {
    case noPreviewsProvided
    
    public var errorDescription: String {
        switch self {
        case .noPreviewsProvided: return "Provided array of previews appears to be empty"
        }
    }
}
