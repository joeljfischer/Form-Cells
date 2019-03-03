//
//  DetailTableViewCell.swift
//  Ding-Timer
//
//  Created by Joel Fischer on 2/11/19.
//  Copyright © 2019 Joel Fischer. All rights reserved.
//

import UIKit

class DetailTableViewCell: FormTableViewCell<String> {
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override var data: String? {
        get {
            return detailTextLabel?.text
        }
        set {
            detailTextLabel?.text = newValue
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
