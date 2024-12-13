# MultiBlur

A SwiftUI package to apply multiple blur effects with different radii and opacities beneath any SwiftUI element.

## Installation

Add `MultiBlur` as a dependency in your `Package.swift` or use Xcode's "Add Package Dependency" feature.

## Usage

```swift
import MultiBlur

VStack {
    Text("Hello, MultiBlur!")
        .font(.largeTitle)
        .padding()
}
.multiblur([(10, 0.3), (1, 0.5), (4, 0.8)])
