//
//  ViewController.swift
//  KitToUI∞
//
//  Created by Heber Alvarez on 29/04/23.
//

import UIKit
import SwiftUI
import Combine

class ViewController: UIViewController {

    private var subs: [AnyCancellable] = []
    private var notifier: EventMessenger = EventMessenger()
    private let countLabel = UILabel()
    private var tapCount: Int = .zero

    override func viewDidLoad() {
        super.viewDidLoad()
        // Our communication bridge from SwiftUI -> UIKit
        notifier.$tapCount.sink { [weak self] count in
            self?.countLabel.text = "This is UIKit control.\nYou tapped \(count) times"
        }
        .store(in: &subs)
        addLabel()
        addButton()
        addSwiftUIView()
    }

    private func addLabel() {
        view.addSubview(countLabel)
        countLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            countLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            countLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        countLabel.numberOfLines = .zero
    }

    private func addButton() {
        let button = UIButton()
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("UIKit Tap", for: .normal)
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 64),
            button.heightAnchor.constraint(equalToConstant: 48),
            button.widthAnchor.constraint(equalToConstant: 96)
        ])
        button.backgroundColor = .gray
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(uikitButtonTapped), for: .touchUpInside)
    }

    private func addSwiftUIView() {
        let tapView = SwiftUIView()
        
        let tapController = UIHostingController(rootView: tapView.environmentObject(notifier))
        view.addSubview(tapController.view)
        addChild(tapController)
        tapController.didMove(toParent: self)
        tapController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tapController.view.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tapController.view.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 196)
        ])
    }

    @objc private func uikitButtonTapped() {
        self.notifier.tapCount += 1
    }
}

