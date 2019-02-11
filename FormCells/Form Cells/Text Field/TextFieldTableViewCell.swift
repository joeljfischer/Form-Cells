//
//  TextFieldTableViewCell.swift
//  Reminders Pro
//
//  Created by Joel Fischer on 10/2/18.
//  Copyright © 2018 Joel Fischer. All rights reserved.
//

import UIKit

class TextFieldTableViewCell: UITableViewCell, Verifiable {
    @IBOutlet weak private var textField: UITextField!

    var rules: [Rule] = []

    var placeholder: String? {
        get {
            return textField.placeholder
        }
        set {
            textField.placeholder = newValue
        }
    }

    var data: String? {
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

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

extension TextFieldTableViewCell: FormTappable {
    func tapped() {
        textField.becomeFirstResponder()
    }
}
