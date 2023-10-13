import SwiftUI

struct FocusableTextField: UIViewRepresentable {
    private let tmpView = WrappableTextField()

    @Binding var focusableTextField: UITextField
    var tag: Int
    var placeholder: String?
    var changeHandler: ((UITextField, String)->Void)?
    var didEndEditing: (()->Void)?
    var didBeginEditing: (() -> Void)?

    init(_ focusableTextField: Binding<UITextField>,
         tag: Int = 0,
         placeholder: String? = nil,
         changeHandler: ((UITextField, String) -> Void)? = nil,
         didEndEditing: (() -> Void)? = nil,
         didBeginEditing:(() -> Void)? = nil) {
        self._focusableTextField = focusableTextField
        self.tag = tag
        self.placeholder = placeholder
        self.changeHandler = changeHandler
        self.didEndEditing = didEndEditing
        self.didBeginEditing = didBeginEditing
    }

    func makeUIView(context: UIViewRepresentableContext<FocusableTextField>) -> WrappableTextField {
        tmpView.tag = tag
        tmpView.delegate = tmpView
        tmpView.placeholder = placeholder
        tmpView.didEndEditing = didEndEditing
        tmpView.onChange = changeHandler
        tmpView.focusableTextField = $focusableTextField
        return tmpView
    }

    func updateUIView(_ uiView: WrappableTextField, context: UIViewRepresentableContext<FocusableTextField>) {
    }
}

extension UITextField {
    @objc func next(_ textField: UITextField) {}
}

class WrappableTextField: UITextField, UITextFieldDelegate {

    var focusableTextField: Binding<UITextField> = .constant(UITextField())
    var onChange: ((UITextField, String)->Void)?
    var didEndEditing: (()->Void)?
    var didBeginEditing: (() -> Void)?

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let nextField = textField.superview?.superview?.viewWithTag(textField.tag + 1) as? UITextField {
            nextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return false
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        focusableTextField.wrappedValue = textField
        didEndEditing?()
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let currentValue = textField.text as NSString? {
            let proposedValue = currentValue.replacingCharacters(in: range, with: string)
            onChange?(textField, proposedValue)
        }
        return true
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        self.endEditing(true)
        didEndEditing?()
    }


    @objc override func next(_ textField: UITextField) {
        _ = textFieldShouldReturn(textField)
    }
}
