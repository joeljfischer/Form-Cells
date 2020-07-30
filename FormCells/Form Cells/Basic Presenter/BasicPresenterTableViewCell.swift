//
//  BasicPresenterTableViewCell.swift
//  Ding-Timer
//
//  Created by Joel Fischer on 2/1/19.
//  Copyright © 2019 Joel Fischer. All rights reserved.
//

import UIKit

class BasicPresenterTableViewCell: FormTableViewCell<Any> {
    var presentingViewController: UIViewController?
    var presentedViewController: FormPresentable? {
        didSet {
            presentedViewController?.presentingCell = self
        }
    }
    var onPresentCallback: ((_ cell: BasicPresenterTableViewCell, _ presentedController: FormPresentable) -> Void)?
    var onDismissCallback: ((_ cell: BasicPresenterTableViewCell, _ dismissedController: FormPresentable) -> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()

        textLabel?.text = nil
        detailTextLabel?.text = nil
        accessoryType = .disclosureIndicator
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        imageView?.contentMode = .scaleAspectFit
        imageView?.bounds = CGRect(x: 0, y: 0, width: 24, height: 24)
    }

    override func tapped() {
        guard let presentedViewController = presentedViewController else {
            preconditionFailure("The presentedViewController must be set before the cell is tapped")
        }

        if let splitViewController = presentingViewController?.splitViewController {
            splitViewController.showDetailViewController(presentedViewController as UIViewController, sender: presentingViewController)
        } else if let navigationController = presentingViewController?.navigationController {
            navigationController.pushViewController(presentedViewController as UIViewController, animated: true)
        }

        if let onPresentCallback = onPresentCallback {
            onPresentCallback(self, presentedViewController)
        }
    }
}
