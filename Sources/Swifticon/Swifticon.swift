//
//  Swifticon.swift
//
//
//  Created by Terje Lønøy on 16/04/2022.
//

import SwiftUI

public class Swifticon {
    
    /**
     Generates app icons for all required sizes. Places them and creates an .appiconset folder with the associated Contents.json file.
     
     - Parameter previews: SwiftUI preview to generate icons from. Typically set as `MyPreview._allPreviews`
     
     - Parameter platforms: Platforms to generate the icons for see `SupportedPlatform`. Defaults to all platforms.
     
     - Parameter assetsDirectoryName: Name of the .xcassets folder the .appiconset folder should be created.
     Exclude suffix in the name. Defaults to Assets
     
     - Parameter iconDirectoryName: Name of the .appiconset folder, without suffix. Defaults to AppIcon
     
     - Parameter drawInHierarchy: Renders complete view hierarchy if true.
     Only set to false if tests is not run towards a simulator or device.
     Might cause unexpected results when false.
     Defaults to true
     
     - Parameter path: Needed for getting path to project folder, no value should be set!
     */
    public static func generateIconAssets(
        fromPreviews previews: [_Preview],
        forPlatforms platforms: [SupportedPlatform] = SupportedPlatform.allCases,
        assetsDirectoryName: String = "Assets",
        iconDirectoryName: String = "AppIcon",
        drawInHierarchy: Bool = true,
        storeAtPath path: String = #file
    ) throws {
        guard !previews.isEmpty else { throw SwifticonError.noPreviewsProvided }
        guard let assetsDirectoryPath = FileStorageManager.getAssetsDirectory(named: assetsDirectoryName, atPath: path) else {
            throw SwifticonError.noAssetsDirectoryFound
        }
        
        let iconDirectoryPath = try FileStorageManager.createIconSetDirectoryIfNonexistent(
            atPath: assetsDirectoryPath,
            named: iconDirectoryName
        )
        
        let imageManager = ImageManager()
        let image = imageManager.getPreviewAsUIImage(
            previews.first!,
            size: .init(
                width: 1024,
                height: 1024
            ),
            drawInHierarchy: drawInHierarchy
        )
        
        try platforms.forEach { platform in
            try platform.targets.forEach { target in
                try target.outputSizes.forEach { outputTarget in
                    try FileStorageManager.saveImage(
                        image.resized(to: .init(
                            width: outputTarget.actualSize,
                            height: outputTarget.actualSize
                        )),
                        atPath: iconDirectoryPath,
                        filename: outputTarget.name
                    )
                }
            }
        }
        
        let contentData = try ContentFactory.generateContentJson(fromPlatforms: platforms)
        try FileStorageManager.saveContentFile(content: contentData, atPath: iconDirectoryPath)
    }
}
