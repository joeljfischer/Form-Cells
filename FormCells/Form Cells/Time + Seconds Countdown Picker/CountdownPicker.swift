//
//  CountdownPicker.swift
//  Ding-Timer
//
//  Created by Joel Fischer on 2/5/19.
//  Copyright © 2019 Joel Fischer. All rights reserved.
//

import UIKit

private enum CountdownPickerComponents: Int, CaseIterable {
    case hour, hourLabel, minute, minuteLabel, second, secondLabel
}

class CountdownPicker: UIPickerView {
    var hour: Int {
        get {
            return selectedRow(inComponent: CountdownPickerComponents.hour.rawValue)
        }
        set {
            selectRow(newValue, inComponent: CountdownPickerComponents.hour.rawValue, animated: true)
        }
    }
    var minute: Int {
        get {
            return selectedRow(inComponent: CountdownPickerComponents.minute.rawValue)
        }
        set {
            selectRow(newValue, inComponent: CountdownPickerComponents.minute.rawValue, animated: true)
        }
    }
    var second: Int {
        get {
            return selectedRow(inComponent: CountdownPickerComponents.second.rawValue)
        }
        set {
            selectRow(newValue, inComponent: CountdownPickerComponents.second.rawValue, animated: true)
        }
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
            columnView = UILabel(frame: CGRect(x: 35, y: 0, width: frame.size.width / 6, height: 44))
            columnView.textAlignment = .center
            columnView.font = UIFont.systemFont(ofSize: 22)
        } else {
            columnView = view as! UILabel
        }

        switch CountdownPickerComponents.allCases[component] {
        case .hour, .minute, .second:
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
        case .hourLabel, .minuteLabel, .secondLabel:
            return 1
        case .hour:
            return 24
        case .minute, .second:
            return 60
        }
    }

    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        switch CountdownPickerComponents.allCases[component] {
        case .hourLabel, .minuteLabel, .secondLabel:
            return pickerView.frame.width / 6
        case .hour, .minute, .second:
            return pickerView.frame.width / 12
        }
    }
}
