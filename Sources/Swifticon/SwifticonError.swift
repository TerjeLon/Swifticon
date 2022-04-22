//
//  SwifticonError.swift
//  
//
//  Created by Terje Lønøy on 18/04/2022.
//

import Foundation

enum SwifticonError: LocalizedError {
    case noPreviewsProvided
    case noAssetsDirectoryFound
    
    public var errorDescription: String {
        switch self {
        case .noPreviewsProvided: return "Provided array of previews appears to be empty"
        case .noAssetsDirectoryFound: return "Provided name for assets directory was not found. Ensure suffix is excluded (.xcassets)"
        }
    }
}
