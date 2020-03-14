//
//  ButtonTableViewCell.swift
//  Reminders Pro
//
//  Created by Joel Fischer on 10/9/18.
//  Copyright © 2018 Joel Fischer. All rights reserved.
//

import UIKit

class ButtonTableViewCell: FormTableViewCell<Any> {
    @IBOutlet private weak var button: UIButton!

    var title: String? {
        didSet {
            button.setTitle(title, for: .normal)
        }
    }

    var attributedTitle: NSAttributedString? {
        didSet {
            button.setAttributedTitle(attributedTitle, for: .normal)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()

        button.addTarget(self, action: #selector(buttonSelected), for: .touchUpInside)
    }

    @objc private func buttonSelected() {
        tapped()
    }
}
