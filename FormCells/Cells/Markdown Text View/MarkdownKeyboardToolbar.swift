//
//  MarkdownKeyboardToolbar.swift
//  Reminders Pro
//
//  Created by Joel Fischer on 10/23/18.
//  Copyright © 2018 Joel Fischer. All rights reserved.
//

import UIKit

// https://stackoverflow.com/a/48694910/1221798
enum MarkdownKeyboardToolbarButtonType: Int {
    case header, unorderedListItem, orderedListItem, italics, bold, closeKeyboard

    func button(target: Any, action: Selector) -> UIBarButtonItem {
        let button = UIBarButtonItem(title: "H1", style: .plain, target: target, action: action)
        button.tag = rawValue

        return button
    }

    static func type(for barButton: UIBarButtonItem) -> MarkdownKeyboardToolbarButtonType? {
        return MarkdownKeyboardToolbarButtonType(rawValue: barButton.tag)
    }
}

protocol MarkdownKeyboardToolbarDelegate: class {
    func keyboardToolbarButtonTapped(_ button: UIBarButtonItem, of type: MarkdownKeyboardToolbarButtonType, toolbar: MarkdownKeyboardToolbar)
}

class MarkdownKeyboardToolbar: UIToolbar {
    weak var markdownButtonDelegate: MarkdownKeyboardToolbarDelegate?

    private let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)

    var leftButtons: [MarkdownKeyboardToolbarButtonType] = [] {
        didSet {
            leftButtonItems = leftButtons.map { (item) -> UIBarButtonItem in
                return item.button(target: self, action: #selector(buttonTapped(sender:)))
            }

            setItems(leftButtonItems + [spacer] + rightButtonItems, animated: false)
        }
    }

    var rightButtons: [MarkdownKeyboardToolbarButtonType] = [] {
        didSet {
            rightButtonItems = rightButtons.map { (item) -> UIBarButtonItem in
                return item.button(target: self, action: #selector(buttonTapped(sender:)))
            }

            setItems(leftButtonItems + [spacer] + rightButtonItems, animated: false)
        }
    }

    private var leftButtonItems: [UIBarButtonItem] = []
    private var rightButtonItems: [UIBarButtonItem] = []

    init(delegate: MarkdownKeyboardToolbarDelegate? = nil) {
        super.init(frame: .zero)
        markdownButtonDelegate = delegate
        prepare()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        prepare()
    }

    private func prepare() {
        barStyle = .default
        isTranslucent = true
        sizeToFit()
        isUserInteractionEnabled = true
    }

    @objc private func buttonTapped(sender: UIBarButtonItem) {
        if let type = MarkdownKeyboardToolbarButtonType.type(for: sender) {
            markdownButtonDelegate?.keyboardToolbarButtonTapped(sender, of: type, toolbar: self)
        }
    }
}
