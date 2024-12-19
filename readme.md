# MultiBlur
<img src=https://github.com/user-attachments/assets/f032653f-d3e7-4052-9449-821d72106053 width="390" height="385" />

A SwiftUI package to create blurred duplicates beneath any SwiftUI component, creating a nice glowy effect.

## Installation

TBD

## Usage

```swift
import MultiBlur

VStack {
    Text("Hello, MultiBlur!")
        .font(.largeTitle)
        .padding()
}
.multiblur([(10, 0.3), (1, 0.5), (4, 0.8)])
