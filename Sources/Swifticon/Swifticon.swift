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
     Exclude suffix in the name.
     
     - Parameter path: Needed for getting path to project folder, no value should be set!
     */
    public static func generateIconAssets(
        fromPreviews previews: [_Preview],
        forPlatforms platforms: [SupportedPlatform] = SupportedPlatform.allCases,
        assetsDirectoryName: String,
        storeAtPath path: String = #file) throws {
        guard !previews.isEmpty else { throw SwifticonError.noPreviewsProvided }
        let imageManager = ImageManager()

        try platforms.forEach { platform in
            try platform.targets.forEach { target in
                try target.outputSizes.forEach { outputTarget in
                    let image = imageManager.getPreviewAsUIImage(
                        previews.first!,
                        size: .init(
                            width: outputTarget.actualSize,
                            height: outputTarget.actualSize
                        )
                    )
                    
                    if let assetsDirectoryPath = FileStorageManager.getAssetsDirectory(named: assetsDirectoryName, atPath: path) {
                        try FileStorageManager.saveImage(image, atPath: assetsDirectoryPath, filename: "test")
                    } else {
                        throw SwifticonError.noAssetsDirectoryFound
                    }
                }
            }
        }
    }
}

struct IconGenerator: PreviewProvider {
    static var previews: some View {
        Text("Hey")
            .swifticon()
    }
}
