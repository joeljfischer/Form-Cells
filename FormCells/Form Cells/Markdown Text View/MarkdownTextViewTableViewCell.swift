//
//  NotesTextViewTableViewCell.swift
//  Reminders Pro
//
//  Created by Joel Fischer on 10/2/18.
//  Copyright © 2018 Joel Fischer. All rights reserved.
//

import UIKit

class MarkdownTextViewTableViewCell: UITableViewCell {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var textView: UITextView!

    private let keyboardToolbar = MarkdownKeyboardToolbar()

    var textViewDelegate: UITextViewDelegate? {
        get {
            return textView.delegate
        }
        set {
            textView.delegate = newValue
        }
    }

    var title: String? {
        get {
            return titleLabel.text
        }
        set {
            titleLabel.text = newValue
        }
    }

    var viewText: String? {
        get {
            return textView.text
        }
        set {
            textView.text = newValue
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()

        keyboardToolbar.markdownButtonDelegate = self
        keyboardToolbar.leftButtons = [.header, .orderedListItem, .unorderedListItem]
        keyboardToolbar.rightButtons = [.closeKeyboard]
        textView.inputAccessoryView = keyboardToolbar
    }
}

extension MarkdownTextViewTableViewCell: MarkdownKeyboardToolbarDelegate {
    func keyboardToolbarButtonTapped(_ button: UIBarButtonItem, of type: MarkdownKeyboardToolbarButtonType, toolbar: MarkdownKeyboardToolbar) {
        switch type {
        case .header: break
        default: break // TODO
        }
    }
}
