import SwiftUI

struct MyTextBox: View {
    var body: some View {
        HStack {
            Text("Example")
        }
        .frame(width: 400, height: 400)
        .background(Color.purple)
        .fontDesign(.serif)
    }
}

struct StickyBar: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                Pill(title: "Pill example 1")
                Pill(title: "Pill example 2")
                Pill(title: "Pill example 3")
                Pill(title: "Pill example 4")
                Pill(title: "Pill example 5")
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: 64)
        .padding()
    }
}

struct Pill: View {
    let title: String

    var body: some View {
        HStack {
            Text(title)
        }
        .padding(.vertical, 6)
        .padding(.horizontal, 12)
        .background(Color.mint)
        .cornerRadius(16)
    }
}

struct ListStickyHeader: View {
    @State private var backgroundColor = Color.clear
    private let stickyHeaderThreshold = 8.0...32.0
    @State private var shadow = Shadow()
    var body: some View {
        VStack {
            ScrollView {
                Text("Test")
                    .frame(width: 400, height: 250)
                LazyVStack(alignment: .leading, spacing: 0, pinnedViews: [.sectionHeaders], content: {
                    Section {
                        ForEach(0..<10) { item in
                            VStack(alignment: .leading, spacing: 0) {
                                MyTextBox()
                                Spacer(minLength: 8)
                            }
                        }
                    } header: {
                        ZStack {
                            shadow
                            StickyBar()
                                .background(GeometryReader {
                                    shadow.preference(key: ViewOffsetKey.self, value: $0.frame(in: .named("area")).origin.y)
                                })
                        }

                    }
                    .onPreferenceChange(ViewOffsetKey.self) { stickyBarYPosition in
                        addShadowProgressively(in: stickyBarYPosition)
                    }
                })
            }
        }
        .coordinateSpace(name: "area")
    }

    // MARK: Helpers

    private func addShadowProgressively(in position: CGFloat) {
        let barYPositionIsFarFromScreenTop = position > stickyHeaderThreshold.upperBound
        let barYPositionIsNearScreenTop = stickyHeaderThreshold ~= position

        if barYPositionIsFarFromScreenTop {
            shadow = Shadow()
        } else if barYPositionIsNearScreenTop {
            let value = position - stickyHeaderThreshold.lowerBound
            let opacity = 1 - value/(stickyHeaderThreshold.upperBound - stickyHeaderThreshold.lowerBound)
            shadow = Shadow(opacity: opacity)
        } else {
            shadow = Shadow(opacity: 1)
        }
    }
}

struct ViewOffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = .zero

    public static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

struct Shadow: View {
    var opacity: CGFloat = 0
    var customGray: Color {
        Color.init(red: 137/255, green: 137/255, blue: 137/255, opacity: 0.3)
    }
    var body: some View {
        Color.clear
            .overlay(alignment: .trailing, content: {
                LinearGradient(gradient: Gradient(colors: [.clear, .clear, customGray.opacity(opacity)]), startPoint: .center, endPoint: .trailing)
            })
    }
}
