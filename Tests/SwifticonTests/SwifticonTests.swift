import XCTest
import SwiftUI
@testable import Swifticon

final class SwifticonTests: XCTestCase {
    func testIt() {
        try! Swifticon.grabIcons(fromPreviews: IconGenerator._allPreviews)
    }
}
