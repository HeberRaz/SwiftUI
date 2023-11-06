import Combine
import SwiftUI

public extension Slider {
    struct Configuration {
        public var value: String?
        public var minimum: CGFloat
        public var maximum: CGFloat
        public var enabled: Bool

        public init(value: String? = nil,
                    minimum: CGFloat,
                    maximum: CGFloat,
                    enabled: Bool = true) {
            self.value = value
            self.minimum = minimum
            self.maximum = maximum
            self.enabled = enabled
        }

        func map(value: CGFloat, from: ClosedRange<CGFloat>, to: ClosedRange<CGFloat>) -> CGFloat {
            let inputRange = from.upperBound - from.lowerBound
            guard inputRange != 0 else { return .zero }
            let outputRange = to.upperBound - to.lowerBound
            return (value - from.lowerBound) / inputRange * outputRange + to.lowerBound
        }
    }

    struct Interaction {
        public var onChangedLeftHandle: (CGFloat) -> Void
        public var onChangedRightHandle: (CGFloat) -> Void

        public init(onChangedLeftHandle: @escaping (CGFloat) -> Void,
                    onChangedRightHandle: @escaping (CGFloat) -> Void) {
            self.onChangedLeftHandle = onChangedLeftHandle
            self.onChangedRightHandle = onChangedRightHandle
        }
    }

    struct Accessibility {
        public var identifier: String
        public var label: String?
        public var leftHandle: String?
        public var rightHandle: String?
        public var minimumValue: Int
        public var maximumValue: Int
        public var handleStep: Int

        var textIdentifier: String {
            "\(identifier)Text"
        }
        var leftHandleIdentifier: String {
            "\(identifier)LeftHandle"
        }
        var rightHandleIdentifier: String {
            "\(identifier)RightHandle"
        }

        public init(identifier: String = String(describing: Slider.self),
                    label: String? = nil,
                    leftHandle: String? = nil,
                    rightHandle: String? = nil,
                    minimumValue: Int,
                    maximumValue: Int,
                    handleStep: Int) {
            self.identifier = identifier
            self.label = label
            self.leftHandle = leftHandle
            self.rightHandle = rightHandle
            self.minimumValue = minimumValue
            self.maximumValue = maximumValue
            self.handleStep = handleStep
        }
    }

    final class ViewModel: ObservableObject {
        @Published public var configuration: Configuration
        @Published public var interaction: Interaction
        @Published public var accessibility: Accessibility

        public init(configuration: Configuration,
                    interaction: Interaction,
                    accessibility: Accessibility) {
            self.configuration = configuration
            self.interaction = interaction
            self.accessibility = accessibility
        }
    }
}
