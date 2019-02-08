//
//  ButtonTableViewCell.swift
//  Reminders Pro
//
//  Created by Joel Fischer on 10/9/18.
//  Copyright © 2018 Joel Fischer. All rights reserved.
//

import UIKit

class ButtonTableViewCell: UITableViewCell, FormTapCallbackable {
    @IBOutlet weak private var button: UIButton!

    var onSelection: ((FormTapCallbackable) -> Void)?
    var title: String? {
        didSet {
            button.setTitle(title, for: .normal)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()

        button.addTarget(self, action: #selector(buttonSelected), for: .touchUpInside)
    }

    @objc private func buttonSelected() {
        tapped()
    }
}

extension ButtonTableViewCell: FormTappable {
    func tapped() {
        guard let onSelection = onSelection else { return }
        onSelection(self)
    }
}
