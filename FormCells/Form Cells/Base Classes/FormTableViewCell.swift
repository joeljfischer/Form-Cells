//
//  FormTableViewCell.swift
//  Ding-Timer
//
//  Created by Joel Fischer on 2/12/19.
//  Copyright © 2019 Joel Fischer. All rights reserved.
//

import UIKit

class FormTableViewCell<DataType>: UITableViewCell {
    var data: DataType?
    var onSelection: (() -> Void) = {}
    var cellHeight: CGFloat {
        get {
            return 44.0
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

    func tapped() {
        onSelection()
    }
}
