//
//  ListSelectionTableViewController.swift
//  Reminders Pro
//
//  Created by Joel Fischer on 10/11/18.
//  Copyright © 2018 Joel Fischer. All rights reserved.
//

import UIKit

class SingleSelectionTableViewController: UITableViewController {
    var onSelection: ((FormOptionValue) -> Void)?

    var value: FormOptionValue?
    var options: [FormOptionValue]! {
        didSet {
            tableView.reloadData()
        }
    }
    var footerText: String? {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: String(describing: UITableViewCell.self))
        navigationItem.largeTitleDisplayMode = .never
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
        guard let onSelection = onSelection,
            let value = value else { return }
        onSelection(value)
    }
}

// MARK: - UITableViewDataSource
extension SingleSelectionTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: UITableViewCell.self), for: indexPath)

        guard let option = options?[indexPath.row] else { preconditionFailure("An option must exist") }
        cell.textLabel?.text = option.title

        return cell
    }

    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return footerText
    }
}

// MARK: - UITableViewDelegate
extension SingleSelectionTableViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let selectedText = tableView.cellForRow(at: indexPath)?.textLabel?.text else { return }
        for option in options where option.title == selectedText {
            value = option
        }

        markCurrentCell()
        navigationController?.popViewController(animated: true)
    }

    private func markCurrentCell() {
        for index in stride(from: 0, to: options.count, by: 1) {
            let cell = tableView.cellForRow(at: IndexPath(row: index, section: 0))
            cell?.accessoryType = .none

            if cell?.textLabel?.text == value?.title {
                cell?.accessoryType = .checkmark
            }
        }
    }
}
