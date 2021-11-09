//
//  DetailTableViewCell.swift
//  Ding-Timer
//
//  Created by Joel Fischer on 2/11/19.
//  Copyright © 2019 Joel Fischer. All rights reserved.
//

import UIKit

class DetailTableViewCell: FormTableViewCell<String> {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

        detailLabel.textColor = .secondaryLabel
    }
}
