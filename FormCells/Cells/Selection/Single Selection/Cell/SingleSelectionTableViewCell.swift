//
//  ListTypeTableViewCell.swift
//  Reminders Pro
//
//  Created by Joel Fischer on 10/2/18.
//  Copyright © 2018 Joel Fischer. All rights reserved.
//

import UIKit

class SingleSelectionTableViewCell: UITableViewCell {
    private var tapGesture: UITapGestureRecognizer!
    private let optionsVC = SingleSelectionTableViewController(style: .grouped)
    var presentingViewController: UIViewController?

    var title: String? {
        didSet {
            textLabel?.text = title
        }
    }

    var value: String? {
        didSet {
            optionsVC.value = value
            detailTextLabel?.text = value
        }
    }

    var options: [String]? {
        didSet {
            optionsVC.options = options
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()

        tapGesture = UITapGestureRecognizer(target: self, action: #selector(cellTapped))
        addGestureRecognizer(tapGesture)

        optionsVC.onSelection = { [weak self] (value) in
            self?.value = value
        }
    }

    @objc private func cellTapped() {
        guard let navigationController = presentingViewController?.navigationController else {
            fatalError("You cannot use the SingleSelectionTableViewCell before setting `presentingViewController` and that view controller must be in a UINavigationController")
        }

        navigationController.pushViewController(optionsVC, animated: true)
        optionsVC.title = title
    }
}
