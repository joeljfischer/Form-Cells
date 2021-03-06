//
//  TimeCountdownTableViewCell.swift
//  Ding-Timer
//
//  Created by Joel Fischer on 2/9/19.
//  Copyright © 2019 Joel Fischer. All rights reserved.
//

import UIKit

class TimeCountdownTableViewCell: FormTableViewCell<TimeInterval> {
    @IBOutlet private weak var picker: CountdownPicker!

    override var data: TimeInterval? {
        get {
            let hour = picker.hour * 60 * 60
            let minute = picker.minute * 60
            let second = picker.second

            return TimeInterval(hour + minute + second)
        }
        set {
            guard let data = newValue else {
                picker.hour = 0
                picker.minute = 0
                picker.second = 0
                return
            }

            let time = data.timeFromTimeInterval
            guard let hour = time.hour, let minute = time.minute, let second = time.second else { preconditionFailure("Hour / Min / Sec should always exist") }
            picker.hour = hour
            picker.minute = minute
            picker.second = second
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()

        picker.heightAnchor.constraint(equalToConstant: 215).isActive = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
