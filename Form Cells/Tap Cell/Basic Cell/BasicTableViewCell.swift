//
//  BasicTableViewCell.swift
//  Ding-Timer
//
//  Created by Joel Fischer on 2/10/19.
//  Copyright © 2019 Joel Fischer. All rights reserved.
//

import UIKit

class BasicTableViewCell: FormTableViewCell<Any> {
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var iconToTitleConstraint: NSLayoutConstraint!
    @IBOutlet weak var leadingToTitleConstraint: NSLayoutConstraint!

    override func awakeFromNib() {
        if iconImageView.image != nil {
            iconToTitleConstraint.isActive = false
            leadingToTitleConstraint.isActive = true
        } else {
            iconToTitleConstraint.isActive = true
            leadingToTitleConstraint.isActive = false
        }
    }
}
