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

    var presenting = false

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func tapped() {
        guard let navigationController = presentingViewController?.navigationController, let presentedViewController = presentedViewController else {
            preconditionFailure("You cannot use the SingleSelectionTableViewCell before setting `presentingViewController` and that view controller must be in a UINavigationController")
        }

        navigationController.pushViewController(presentedViewController as UIViewController, animated: true)
        presenting = true

        if let onPresentCallback = onPresentCallback {
            onPresentCallback(self, presentedViewController)
        }
    }
}
