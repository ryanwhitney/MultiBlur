// MultiBlur.swift
import SwiftUI

public struct MultiBlur: ViewModifier {
    let configurations: [(radius: CGFloat, opacity: Double)]

    public func body(content: Content) -> some View {
        ZStack {
            // Render blurred layers underneath the original content
            ForEach(configurations.indices, id: \..self) { index in
                let config = configurations[index]
                content
                    .blur(radius: config.radius)
                    .opacity(config.opacity)
                    .accessibility(hidden: true)
            }
            // Original content is on top
            content
        }
    }
}

extension View {
    /// Applies multiple blur effects to the view by creating multiple layers with specified blur radii and opacities.
    /// - Parameter configurations: An array of tuples specifying the blur radius and opacity for each layer.
    /// - Returns: A view with multiple blur layers applied.
    public func multiblur(_ configurations: [(radius: CGFloat, opacity: Double)]) -> some View {
        self.modifier(MultiBlur(configurations: configurations))
    }
}


// Example Usage

struct MultiBlur_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            VStack{
                LinearGradient(
                    colors: [.red, .blue, .green, .yellow],
                    startPoint: .leading,
                    endPoint: .trailing
                )
                .frame(width: 400, height: 200)
                .mask(
                    Text("Hello, MultiBlur.")
                        .font(Font.system(size: 46, weight: .bold))
                        .multilineTextAlignment(.center)
                )
                .multiblur([(10, 0.5), (20, 0.5), (40, 1), (60, 1)])
            }.background(Color.black)

            VStack{
                LinearGradient(
                    colors: [.red, .blue, .green, .yellow],
                    startPoint: .leading,
                    endPoint: .trailing
                )
                .frame(width: 400, height: 200)
                .mask(
                    Text("Hello, MultiBlur.")
                        .font(Font.system(size: 46, weight: .bold))
                        .multilineTextAlignment(.center)
                )
                .multiblur([(10, 0.5), (20, 0.5), (40, 1), (60, 1)])

            }
        }
    }
}
