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

    var data: TimeInterval {
        get {
            let hour = picker.hour * 60 * 60
            let minute = picker.minute * 60
            let second = picker.second

            return TimeInterval(hour + minute + second)
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
}
