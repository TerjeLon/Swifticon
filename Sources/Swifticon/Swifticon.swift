//
//  Swifticon.swift
//
//
//  Created by Terje Lønøy on 16/04/2022.
//

import SwiftUI

public struct Swifticon {
    public static func grabIcons(fromPreviews previews: [_Preview]) throws {
        guard !previews.isEmpty else { throw SwifticonError.noPreviewsProvided }
        let imageGrabber = ImageGrabber()

        SupportedPlatform.allCases.forEach { platform in
            platform.targets.forEach { target in
                target.outputSizes.forEach { outputTarget in
                    let image = imageGrabber.getPreviewAsUIImage(
                        previews.first!,
                        size: .init(
                            width: outputTarget.actualSize,
                            height: outputTarget.actualSize
                        )
                    )
                    
                    print(image)
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
