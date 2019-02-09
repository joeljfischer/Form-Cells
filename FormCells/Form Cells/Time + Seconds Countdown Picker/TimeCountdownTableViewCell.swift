//
//  TimeCountdownTableViewCell.swift
//  Ding-Timer
//
//  Created by Joel Fischer on 2/9/19.
//  Copyright © 2019 Joel Fischer. All rights reserved.
//

import UIKit

class TimeCountdownTableViewCell: UITableViewCell {
    @IBOutlet weak var picker: CountdownPicker!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
