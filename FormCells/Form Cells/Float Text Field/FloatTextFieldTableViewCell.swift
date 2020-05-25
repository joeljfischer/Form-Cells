//
//  FloatTextFieldTableViewCell.swift
//  Ding-Timer
//
//  Created by Joel Fischer on 1/31/19.
//  Copyright © 2019 Joel Fischer. All rights reserved.
//

import SkyFloatingLabelTextField
import UIKit

class FloatTextFieldTableViewCell: UITableViewCell {
    @IBOutlet private weak var textField: SkyFloatingLabelTextField!

    var placeholder: String? {
        get {
            return textField.placeholder
        }
        set {
            textField.placeholder = newValue
        }
    }

    var title: String? {
        get {
            return textField.title
        }
        set {
            textField.title = newValue
        }
    }

    var fieldText: String? {
        get {
            return textField.text
        }
        set {
            textField.text = newValue
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
