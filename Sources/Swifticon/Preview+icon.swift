//
//  Preview+icon.swift
//  
//
//  Created by Terje Lønøy on 16/04/2022.
//

import SwiftUI

extension View {
    public func swifticon() -> some View {
        return self
            .frame(width: 1024, height: 1024)
            .previewLayout(.sizeThatFits)
    }
}
