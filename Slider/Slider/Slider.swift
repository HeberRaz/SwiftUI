import SwiftUI

public struct Slider: View {
    @ObservedObject private var viewModel: ViewModel
    @Binding private var minimumValue: CGFloat
    @Binding private var maximumValue: CGFloat

    @State private var width: CGFloat = .zero
    @State private var widthTow: CGFloat = 144
    @State private var totalScreen: CGFloat = .zero
    @State private var isDraggingLeft = false
    @State private var isDraggingRight = false
    private let offsetValue: CGFloat = 40

    @State private var widthSlider: CGFloat = .zero

    private let constants = Constants()

    public init(_ viewModel: ViewModel, minimumValue: Binding<CGFloat>, maximumValue: Binding<CGFloat>) {
        self.viewModel = viewModel
        _minimumValue = minimumValue
        _maximumValue = maximumValue
    }

    public var body: some View {
        slider
    }
}

extension Slider {
    @ViewBuilder
    var slider: some View {
        ZStack {
            GeometryReader { geometry in
                VStack(alignment: .leading, spacing: 8) {
                    if let text = configuration.value {
                        Text(text)
                            .accessibilityLabel(accessibility.label ?? "")
                    }
                    ZStack(alignment: .leading) {
                        baseFill
                        frontFill
                        HStack(spacing: .zero) {
                            leftHandle
                            rightHandle
                        }
                    }
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
                .onAppear {
                    setupInitialSliderView(geometry: geometry)
                }
            }
        }
    }

    private func setupInitialSliderView(geometry: GeometryProxy) {
        totalScreen = geometry.size.width - offsetValue
        width = configuration.map(value: minimumValue, from: configuration.minimum...configuration.maximum, to: 0...totalScreen)
        widthTow = configuration.map(value: maximumValue, from: configuration.minimum...configuration.maximum, to: 0...totalScreen)
    }

    var leftHandle: some View {
        Handler(handlerType: .left,
                handlerValue: $minimumValue,
                isDragging: $isDraggingLeft,
                position: $width,
                otherPostion: $widthTow,
                limit: totalScreen,
                sliderModel: viewModel)
        .accessibilityElement(children: .ignore)
        .accessibilityIdentifier(accessibility.leftHandleIdentifier)
        .accessibilityLabel(accessibility.leftHandle ?? "")
        .accessibilityValue("\(accessibility.minimumValue)")
        .accessibilityAdjustableAction { handler in
            switch handler {
            case .decrement:
                interaction?.onChangedLeftHandle(minimumValue)
            case .increment:
                interaction?.onChangedLeftHandle(minimumValue)
            default:
                break
            }
        }
    }

    var rightHandle: some View {
        Handler(handlerType: .right,
                handlerValue: $maximumValue,
                isDragging: $isDraggingRight,
                position: $widthTow,
                otherPostion: $width,
                limit: totalScreen,
                sliderModel: viewModel)
        .accessibilityElement(children: .ignore)
        .accessibilityIdentifier(accessibility.rightHandleIdentifier)
        .accessibilityLabel(accessibility.rightHandle ?? "")
        .accessibilityValue("\(accessibility.maximumValue)")
        .accessibilityAdjustableAction { handler in
            switch handler {
            case .decrement:
                interaction?.onChangedLeftHandle(maximumValue)
            case .increment:
                interaction?.onChangedLeftHandle(maximumValue)
            default:
                break
            }
        }

    }
}

// MARK: - Shortcuts
private extension Slider {
    var configuration: Configuration {
        viewModel.configuration
    }

    var interaction: Interaction? {
        viewModel.interaction
    }

    var accessibility: Accessibility {
        viewModel.accessibility
    }
}

// MARK: - UI
private extension Slider {
    var textColor: Color {
        configuration.enabled ? .primary : .secondary
    }

    var handleColor: Color {
        configuration.enabled ? .blue : .gray
    }

    var handleTintColor: Color {
        configuration.enabled ? .cyan : .blue
    }

    var handleBorderColor: Color {
        configuration.enabled ? .yellow : .orange
    }

    var trackColor: Color {
        configuration.enabled ? .purple : .red
    }

    var fillColor: Color {
        configuration.enabled ? .green : .red
    }

    var handleStep: CGFloat {
        CGFloat(accessibility.handleStep)
    }
}

// MARK: - Position Handler
private extension Slider {
    func leftHandler(pos: CGFloat) {
        let location = pos - handlerHalfSize
        let sliderLocation = min(location, maximumValue)
        minimumValue = max(sliderLocation, -widthSlider)
        interaction?.onChangedLeftHandle((minimumValue + widthSlider) / 4)
    }

    func rightHandler(pos: CGFloat) {
        let location = pos - handlerHalfSize
        let sliderLocation = max(location, minimumValue)
        maximumValue = min(sliderLocation, widthSlider)
        interaction?.onChangedRightHandle((maximumValue + widthSlider) / 4)
    }

    /// Represents half the width of the icon (icon350) from the current theme.
    var handlerHalfSize: CGFloat {
        handlerSize.width / 2
    }

    var handlerSize: CGSize {
        CGSize(width: 32, height: 32)
    }
}

// MARK: - Subviews
private extension Slider {
    @ViewBuilder
    var baseHandle: some View {
        ZStack {
            Circle().foregroundColor(handleColor)
        }
        .cornerRadius(12)
        .frame(width: handlerSize.width, height: handlerSize.height)
    }

    @ViewBuilder
    var lefttHandle: some View {
        baseHandle
            .transformEffect(CGAffineTransform(translationX: minimumValue, y: 0))
            .gesture(DragGesture()
                .onChanged { gesture in
                    if configuration.enabled {
                        leftHandler(pos: gesture.location.x)
                    }
                })
            .accessibilityElement(children: .ignore)
            .accessibilityIdentifier(accessibility.leftHandleIdentifier)
            .accessibilityLabel(accessibility.leftHandle ?? "")
            .accessibilityValue("\(accessibility.minimumValue)")
            .accessibilityAdjustableAction { handler in
                switch handler {
                case .decrement:
                    leftHandler(pos: minimumValue - handleStep)
                case .increment:
                    leftHandler(pos: minimumValue + handleStep)
                default:
                    break
                }
            }
    }

    @ViewBuilder
    var righttHandle: some View {
        baseHandle
            .transformEffect(CGAffineTransform(translationX: maximumValue, y: 0))
            .gesture(DragGesture()
                .onChanged { gesture in
                    if configuration.enabled {
                        rightHandler(pos: gesture.location.x)
                    }
                })
            .accessibilityElement(children: .ignore)
            .accessibilityIdentifier(accessibility.rightHandleIdentifier)
            .accessibilityLabel(accessibility.rightHandle ?? "")
            .accessibilityValue("\(accessibility.maximumValue)")
            .accessibilityAdjustableAction { handler in
                switch handler {
                case .decrement:
                    rightHandler(pos: maximumValue - handleStep)
                case .increment:
                    rightHandler(pos: maximumValue + handleStep)
                default:
                    break
                }
            }
    }

    enum HandlerType {
        case left
        case right
    }

    struct Handler: View {
        private let handlerType: HandlerType
        @Binding var handlerValue: CGFloat
        @Binding var isDragging: Bool
        @Binding var position: CGFloat
        @Binding var otherPostion: CGFloat
        var limit: CGFloat
        private let sliderModel: Slider.ViewModel

        init(handlerType: HandlerType,
             handlerValue: Binding<CGFloat>,
             isDragging: Binding<Bool>,
             position: Binding<CGFloat>,
             otherPostion: Binding<CGFloat>,
             limit: CGFloat,
             sliderModel: Slider.ViewModel) {
            self.handlerType = handlerType
            self._handlerValue = handlerValue
            self._isDragging = isDragging
            self._position = position
            self._otherPostion = otherPostion
            self.limit = limit
            self.sliderModel = sliderModel
        }

        var handlerSize: CGSize {
            CGSize(width: 32, height: 32)
        }

        var handleColor: Color {
            sliderModel.configuration.enabled ? .blue : .gray
        }

        var handleTintColor: Color {
            sliderModel.configuration.enabled ? .cyan : .blue
        }

        var handleBorderColor: Color {
            sliderModel.configuration.enabled ? .yellow : .orange
        }

        @ViewBuilder
        var baseHandle: some View {
            ZStack {
                Circle().foregroundColor(handleColor)
            }
            .cornerRadius(12)
            .frame(width: handlerSize.width, height: handlerSize.height)
        }

        var body: some View {
            ZStack {
                baseHandle
            }
            .offset(x: position + (handlerType == .left ? .zero : -24))
            .gesture(
                DragGesture()
                    .onChanged({ value in
                        withAnimation {
                            isDragging = true
                        }
                        switch handlerType {
                        case .left:
                            position = min(max(value.location.x, .zero), otherPostion)
                            handlerValue = CGFloat(sliderModel.configuration.map(value: position,
                                                                                 from: .zero...limit,
                                                                                 to: sliderModel.configuration.minimum...sliderModel.configuration.maximum))
                            sliderModel.interaction.onChangedLeftHandle(handlerValue)
                        case .right:
                            position = min(max(value.location.x, otherPostion), limit)
                            handlerValue = CGFloat(sliderModel.configuration.map(value: position,
                                                                                 from: .zero...limit,
                                                                                 to: sliderModel.configuration.minimum...sliderModel.configuration.maximum))
                            sliderModel.interaction.onChangedRightHandle(handlerValue)
                        }
                    })
                    .onEnded({ value in
                        withAnimation {
                            isDragging = false
                        }
                    })
            )
        }
    }

    @ViewBuilder
    var leftTrack: some View {
        Rectangle()
            .frame(height: constants.height)
            .frame(width: abs(widthSlider + minimumValue))
            .cornerRadius(8)
            .foregroundColor(trackColor)
    }

    @ViewBuilder
    var rightTrack: some View {
        Rectangle()
            .frame(height: constants.height)
            .frame(width: abs(widthSlider - maximumValue))
            .cornerRadius(8)
            .foregroundColor(trackColor)
    }

    @ViewBuilder
    var fill: some View {
        Rectangle()
            .frame(height: constants.height)
            .frame(width: maximumValue - minimumValue)
            .cornerRadius(8)
            .foregroundColor(fillColor)
    }

    @ViewBuilder
    var baseFill: some View {
        Rectangle()
            .foregroundColor(trackColor)
            .cornerRadius(8)
            .frame(height: constants.height)
    }

    @ViewBuilder
    var frontFill: some View {
        Rectangle()
            .foregroundColor(fillColor)
            .frame(width: widthTow - width, height: constants.height)
            .offset(x: width + handlerHalfSize)
    }
}

// MARK: - Constants
private extension Slider {
    struct Constants {
        /// Represents the height of the slider, which is fixed at 8 units.
        let height: CGFloat = 8
    }
}

// MARK: - Previews
struct MBSliderPreviews: PreviewProvider {
    static var previews: some View {
        SliderPreview()
    }
}

struct SliderPreview: View {
    @State var currentMinimumValue: CGFloat = 25
    @State var currentMaximumValue: CGFloat = 75

    var body: some View {
        VStack(spacing: 8) {
            let value = "\(Int(currentMinimumValue)) / \(Int(currentMaximumValue))"
            Text(value)
            Slider(Slider.ViewModel(configuration: Slider.Configuration(minimum: 0,
                                                                              maximum: 100),
                                        interaction: Slider.Interaction(onChangedLeftHandle: { _ in },
                                                                          onChangedRightHandle: { _ in }),
                                        accessibility: Slider.Accessibility(minimumValue: 0, maximumValue: 100, handleStep: 5)),
                     minimumValue: $currentMinimumValue,
                     maximumValue: $currentMaximumValue)
            .frame(height: 90)
        }
        .padding()
    }
}
