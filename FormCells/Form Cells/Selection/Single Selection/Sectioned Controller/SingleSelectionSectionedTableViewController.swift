//
//  SingleSelectionSectionedController.swift
//  Reminders Pro
//
//  Created by Joel Fischer on 11/3/18.
//  Copyright © 2018 Joel Fischer. All rights reserved.
//

import UIKit

// swiftlint:disable type_name
class SingleSelectionSectionedTableViewController: UITableViewController {
    var onSelection: ((String?) -> Void)?

    var value: String?
    var options = [String: [String]]() {
        didSet {
            keys = Array(options.keys)
            tableView.reloadData()
        }
    }

    private var keys: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: String(describing: UITableViewCell.self))
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        markCurrentCell()

        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: selectedIndexPath, animated: false)
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        guard let onSelection = onSelection else { return }
        onSelection(value)
    }
}

// MARK: - UITableViewDataSource
extension SingleSelectionSectionedTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return options.count
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return keys[section]
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let key = keys[section]
        return options[key]?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: UITableViewCell.self), for: indexPath)

        let key = keys[indexPath.section]
        guard let optionText = options[key]?[indexPath.row] else { fatalError("The options must exist for a given key") }
        cell.textLabel?.text = optionText

        return cell
    }
}

// MARK: - UITableViewDelegate
extension SingleSelectionSectionedTableViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        value = tableView.cellForRow(at: indexPath)?.textLabel?.text
        markCurrentCell()
        navigationController?.popViewController(animated: true)
    }

    private func markCurrentCell() {
        for index in stride(from: 0, to: options.count, by: 1) {
            let cell = tableView.cellForRow(at: IndexPath(row: index, section: 0))
            cell?.accessoryType = .none

            if cell?.textLabel?.text == value {
                cell?.accessoryType = .checkmark
            }
        }
    }
}
