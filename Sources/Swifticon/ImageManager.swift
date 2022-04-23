//
//  ImageManager.swift
//  
//
//  Created by Terje Lønøy on 16/04/2022.
//

import SwiftUI

class ImageManager {
    func getPreviewAsUIImage(_ preview: _Preview, size: CGSize) -> UIImage {
        let view = preview.content
        let window = UIWindow(frame: CGRect(origin: .zero, size: size))
        
        let hosting = UIHostingController(rootView: view)
        hosting.view.frame = window.frame
        
        window.addSubview(hosting.view)
        window.makeKeyAndVisible()
        
        let imageView = hosting.view!
        let renderer = UIGraphicsImageRenderer(bounds: imageView.bounds)
        
        imageView.backgroundColor = .clear
            
        let image = renderer.image { ctx in
            imageView.layer.render(in: ctx.cgContext)
        }
        
        return image
    }
}
