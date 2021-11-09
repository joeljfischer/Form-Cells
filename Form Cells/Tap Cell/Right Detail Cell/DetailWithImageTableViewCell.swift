//
//  DetailWithImageTableViewCell.swift
//  List Lord
//
//  Created by Joel Fischer on 11/9/21.
//  Copyright © 2021 appealingapps. All rights reserved.
//

import UIKit

class DetailWithImageTableViewCell: FormTableViewCell<Any> {
    @IBOutlet weak var primaryImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        detailLabel.textColor = .secondaryLabel
    }
}
