//
//  Image+resize.swift
//
//
//  Created by Terje Lønøy on 16/04/2022.
//

import UIKit

extension UIImage {
    func resized(to size: CGSize) -> UIImage {
        let scalingFactor = UIScreen.main.scale
        let scaledSize = size.width / scalingFactor
        let size = CGSize(width: scaledSize, height: scaledSize)
        
        return UIGraphicsImageRenderer(size: size).image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
    }
}
