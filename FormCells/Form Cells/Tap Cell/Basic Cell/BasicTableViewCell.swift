//
//  BasicTableViewCell.swift
//  Ding-Timer
//
//  Created by Joel Fischer on 2/10/19.
//  Copyright © 2019 Joel Fischer. All rights reserved.
//

import UIKit

class BasicTableViewCell: UITableViewCell, FormTapCallbackable {
    var onSelection: (() -> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

extension BasicTableViewCell: FormTappable {
    func tapped() {
        self.onSelection?()
    }
}
