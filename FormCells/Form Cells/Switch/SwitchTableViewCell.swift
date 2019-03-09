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
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override func tapped() {
        super.tapped()
        onOffSwitch.isOn = !onOffSwitch.isOn
    }
}
