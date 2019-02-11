//
//  DetailTableViewCell.swift
//  Ding-Timer
//
//  Created by Joel Fischer on 2/11/19.
//  Copyright © 2019 Joel Fischer. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell, FormTapCallbackable {
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

extension DetailTableViewCell: FormTappable {
    func tapped() {
        guard let onSelection = onSelection else { return }
        onSelection()
    }
}
