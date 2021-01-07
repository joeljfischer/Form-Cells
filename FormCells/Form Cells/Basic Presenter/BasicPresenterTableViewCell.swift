//
//  BasicPresenterTableViewCell.swift
//  Ding-Timer
//
//  Created by Joel Fischer on 2/1/19.
//  Copyright © 2019 Joel Fischer. All rights reserved.
//

import UIKit

class BasicPresenterTableViewCell: FormTableViewCell<Any> {
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!

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

        iconImageView.image = nil
        titleLabel.text = nil
        accessoryType = .disclosureIndicator
    }

    override func tapped() {
        guard let presentingViewController = presentingViewController, let presentedViewController = presentedViewController else {
            preconditionFailure("The presenting / presentedViewController must be set before the cell is tapped")
        }

        if let navigationController = presentingViewController.navigationController {
            navigationController.pushViewController(presentedViewController as UIViewController, animated: true)
        }

        if let onPresentCallback = onPresentCallback {
            onPresentCallback(self, presentedViewController)
        }
    }
}
