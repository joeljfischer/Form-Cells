//
//  TextFieldTableViewCell.swift
//  Reminders Pro
//
//  Created by Joel Fischer on 10/2/18.
//  Copyright © 2018 Joel Fischer. All rights reserved.
//

import UIKit

class TextFieldTableViewCell: FormTableViewCell<String>, UITextFieldDelegate {
    @IBOutlet weak var textField: UITextField!

    var placeholder: String? {
        get {
            return textField.placeholder
        }
        set {
            textField.placeholder = newValue
        }
    }

    override var data: String? {
        get {
            return textField.text
        }
        set {
            textField.text = newValue
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()

        textField.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override func tapped() {
        textField.becomeFirstResponder()
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()

        return false
    }
}
