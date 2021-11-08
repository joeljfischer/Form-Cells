//
//  SwitchTableViewCell.swift
//  Ding-Timer
//
//  Created by Joel Fischer on 3/2/19.
//  Copyright © 2019 Joel Fischer. All rights reserved.
//

import UIKit

class SwitchTableViewCell: FormTableViewCell<Bool> {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var onOffSwitch: UISwitch!

    var onChange: ((Bool) -> Void)?

    var title = NSAttributedString() {
        didSet {
            titleLabel.attributedText = title
        }
    }

    override var data: Bool? {
        get {
            return onOffSwitch.isOn
        }
        set {
            onOffSwitch.isOn = newValue ?? false
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()

        onOffSwitch.addTarget(self, action: #selector(switchValueDidChange), for: .touchUpInside)
    }

    override func tapped() {
        super.tapped()
        onOffSwitch.isOn = !onOffSwitch.isOn

        onChange?(onOffSwitch.isOn)
    }
}

// MARK: - Actions
extension SwitchTableViewCell {
    @objc private func switchValueDidChange() {
        onChange?(onOffSwitch.isOn)
    }
}
