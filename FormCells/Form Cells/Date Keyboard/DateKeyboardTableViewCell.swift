//
//  DateKeyboardTableViewCell.swift
//  Reminders Pro
//
//  Created by Joel Fischer on 10/10/18.
//  Copyright © 2018 Joel Fischer. All rights reserved.
//

import UIKit

class DateKeyboardTableViewCell: UITableViewCell {
    // https://stackoverflow.com/questions/29678471/expanding-and-collapsing-uitableviewcells-with-datepicker

    // https://github.com/xmartlabs/Eureka/blob/master/Source/Rows/DateInlineRow.swift
    // https://github.com/xmartlabs/Eureka/blob/master/Source/Rows/DatePickerRow.swift
    // https://github.com/xmartlabs/Eureka/blob/master/Source/Rows/DateRow.swift
    // https://github.com/xmartlabs/Eureka/blob/864cfa640566b35b6e119d45dd748523b62fb1c7/Source/Rows/Common/DateFieldRow.swift

    var type: UIDatePicker.Mode = .date
    var minimumDate: Date?
    var maximumDate: Date?
    var dateFormatter = DateFormatter()
    var minuteInterval: Int?

    var title: String? {
        didSet {
            textLabel?.text = title
        }
    }
    var value: Date? {
        didSet {
            if let value = value {
                detailTextLabel?.text = dateFormatter.string(from: value)
            } else {
                detailTextLabel?.text = ""
            }
        }
    }

    private let datePicker = UIDatePicker()
    private var tapGesture: UITapGestureRecognizer!

    override func awakeFromNib() {
        super.awakeFromNib()

        tapGesture = UITapGestureRecognizer(target: self, action: #selector(cellTapped))
        addGestureRecognizer(tapGesture)

        datePicker.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)

        detailTextLabel?.text = ""
    }

    private func prepareDatePicker() {
        datePicker.datePickerMode = type
        datePicker.setDate(value ?? Date(), animated: true)
        datePicker.minimumDate = minimumDate
        datePicker.maximumDate = maximumDate

        if let minuteInterval = minuteInterval {
            datePicker.minuteInterval = minuteInterval
        }
    }

    private func prepareDateFormatter() {
        dateFormatter.locale = .current
        switch type {
        case .date:
            dateFormatter.dateStyle = .medium
            dateFormatter.timeStyle = .none
        case .time:
            dateFormatter.dateStyle = .none
            dateFormatter.timeStyle = .medium
        case .dateAndTime:
            dateFormatter.dateStyle = .short
            dateFormatter.timeStyle = .short
        case .countDownTimer:
            fatalError("Countdown timer is not supported in this cell")
        @unknown default:
            fatalError("Unknown type is not supported in this cell")
        }
    }

    override var inputView: UIView? {
        if let value = value {
            datePicker.setDate(value, animated: true)
        }

        return datePicker
    }

    override var canBecomeFirstResponder: Bool {
        return true
    }

    @objc private func cellTapped() {
        prepareDatePicker()
        prepareDateFormatter()

        becomeFirstResponder()
    }
}

extension DateKeyboardTableViewCell {
    @objc private func datePickerValueChanged(_ sender: UIDatePicker) {
        self.value = sender.date
    }
}
