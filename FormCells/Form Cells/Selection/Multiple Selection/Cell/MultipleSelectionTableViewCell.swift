//
//  MultipleSelectionTableViewCell.swift
//  Reminders Pro
//
//  Created by Joel Fischer on 10/11/18.
//  Copyright © 2018 Joel Fischer. All rights reserved.
//

import UIKit

class MultipleSelectionTableViewCell: FormTableViewCell<Any> {
    private let optionsVC = MultipleSelectionTableViewController(style: .grouped)
    var presentingViewController: UIViewController?

    var title: String? {
        didSet {
            textLabel?.text = title
        }
    }

    var values: [String]? {
        didSet {
            optionsVC.values = values
            detailTextLabel?.text = selectedValuesString
        }
    }

    var options: [String]? {
        didSet {
            optionsVC.options = options
        }
    }

    private var selectedValuesString: String {
        guard let values = values else { return "" }

        switch values.count {
        case 0:
            return ""
        case 1:
            return values.first!
        default:
            return "\(values.count) selected"
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()

        optionsVC.onSelection = { [weak self] (values) in
            self?.values = values
        }
    }

    override func tapped() {
        guard let navigationController = presentingViewController?.navigationController else {
            preconditionFailure("You cannot use the MultipleSelectionTableViewCell before setting `presentingViewController` and that view controller must be in a UINavigationController")
        }

        navigationController.pushViewController(optionsVC, animated: true)
        optionsVC.title = title
    }
}
