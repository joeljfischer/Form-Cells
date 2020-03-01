//
//  MultipleSelectionTableViewController.swift
//  Reminders Pro
//
//  Created by Joel Fischer on 10/11/18.
//  Copyright © 2018 Joel Fischer. All rights reserved.
//

import UIKit

class MultipleSelectionTableViewController: UITableViewController {
    var onSelection: (([String]?) -> Void)?

    var values: [String]?
    var options: [String]! {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: String(describing: UITableViewCell.self))
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        guard let onSelection = onSelection else { return }
        onSelection(values)
    }
}

// MARK: - Table View Data Source
extension MultipleSelectionTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: UITableViewCell.self), for: indexPath)

        let cellText = options[indexPath.row]
        if let isSelected = values?.contains(cellText), isSelected == true {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }

        cell.textLabel?.text = cellText

        return cell
    }
}

// MARK: - UITableViewDelegate
extension MultipleSelectionTableViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) else { preconditionFailure("Cell must exist") }
        guard let cellText = cell.textLabel?.text else { return }

        if cell.accessoryType != .checkmark {
            cell.accessoryType = .checkmark
            values?.append(cellText)
        } else {
            cell.accessoryType = .none
            values?.removeAll(where: { (value: String) -> Bool in
                value == cellText
            })
        }
    }
}
