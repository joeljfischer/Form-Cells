//
//  CountdownPicker.swift
//  Ding-Timer
//
//  Created by Joel Fischer on 2/5/19.
//  Copyright © 2019 Joel Fischer. All rights reserved.
//

import UIKit

class CountdownPicker: UIPickerView {
    var hour = 0
    var minute = 0
    var second = 0

    private enum CountdownPickerComponents: CaseIterable {
        case hour, hourLabel, minute, minuteLabel, second, secondLabel
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        prepare()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        prepare()
    }

    private func prepare() {
        delegate = self
        dataSource = self
    }

    var date: Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        let date = dateFormatter.date(from: "\(hour)\(minute)\(second)")!
        return date
    }
}

extension CountdownPicker: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch CountdownPickerComponents.allCases[component] {
        case .hour:
            hour = row
        case .minute:
            minute = row
        case .second:
            second = row
        default: break
        }
    }

    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let columnView: UILabel
        if view == nil {
            columnView = UILabel(frame: CGRect(x: 35, y: 0, width: frame.size.width / 3, height: 44))
            columnView.textAlignment = .center
        } else {
            columnView = view as! UILabel
        }

        switch CountdownPickerComponents.allCases[component] {
        case .hour: fallthrough
        case .minute: fallthrough
        case .second:
            columnView.text = "\(row)"
        case .hourLabel:
            columnView.text = "hr"
        case .minuteLabel:
            columnView.text = "min"
        case .secondLabel:
            columnView.text = "sec"
        }

        return columnView
    }
}

extension CountdownPicker: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return CountdownPickerComponents.allCases.count
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch CountdownPickerComponents.allCases[component] {
        case .hourLabel: fallthrough
        case .minuteLabel: fallthrough
        case .secondLabel:
            return 1
        case .hour:
            return 24
        case .minute: fallthrough
        case .second:
            return 60
        }
    }

    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        switch CountdownPickerComponents.allCases[component] {
        case .hourLabel: fallthrough
        case .minuteLabel: fallthrough
        case .secondLabel:
            return pickerView.frame.width / 12
        case .hour: fallthrough
        case .minute: fallthrough
        case .second:
            return pickerView.frame.width / 6
        }
    }
}