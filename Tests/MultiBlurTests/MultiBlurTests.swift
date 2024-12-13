import XCTest
import SwiftUI
@testable import MultiBlur

@MainActor
final class MultiBlurTests: XCTestCase {

    func testEmptyConfigurations() {
        let configs: [(radius: CGFloat, opacity: Double)] = []
        let modifier = MultiBlur(configurations: configs)

        XCTAssertNotNil(modifier)
        XCTAssertTrue(modifier.configurations.isEmpty)

        let view = Text("Hello").modifier(modifier)
        XCTAssertNotNil(view)
    }

    func testSingleConfiguration() {
        let configs: [(radius: CGFloat, opacity: Double)] = [(10, 0.5)]
        let modifier = MultiBlur(configurations: configs)

        XCTAssertEqual(modifier.configurations.count, 1)
        XCTAssertEqual(modifier.configurations[0].radius, 10)
        XCTAssertEqual(modifier.configurations[0].opacity, 0.5)

        let view = Text("Hello").modifier(modifier)
        XCTAssertNotNil(view)
    }

    func testMultipleConfigurations() {
        let configs: [(radius: CGFloat, opacity: Double)] = [
            (5, 0.3),
            (10, 0.5),
            (20, 0.8)
        ]
        let modifier = MultiBlur(configurations: configs)

        XCTAssertEqual(modifier.configurations.count, 3)
        XCTAssertEqual(modifier.configurations[0].radius, 5)
        XCTAssertEqual(modifier.configurations[0].opacity, 0.3)
        XCTAssertEqual(modifier.configurations[1].radius, 10)
        XCTAssertEqual(modifier.configurations[1].opacity, 0.5)
        XCTAssertEqual(modifier.configurations[2].radius, 20)
        XCTAssertEqual(modifier.configurations[2].opacity, 0.8)

        let view = Text("Test").modifier(modifier)
        XCTAssertNotNil(view)
    }

    func testNegativeRadius() {
        let configs: [(radius: CGFloat, opacity: Double)] = [(-5, 0.5)]
        let modifier = MultiBlur(configurations: configs)

        XCTAssertEqual(modifier.configurations.count, 1)
        XCTAssertEqual(modifier.configurations[0].radius, -5)
        XCTAssertEqual(modifier.configurations[0].opacity, 0.5)

        let view = Text("Negative").modifier(modifier)
        XCTAssertNotNil(view)
    }

    func testExtensionMethod() {
        let configs: [(radius: CGFloat, opacity: Double)] = [(15, 0.7)]
        let view = Text("Extended").multiblur(configs)

        XCTAssertNotNil(view)
    }
}
