//
//  BasicTableViewCell.swift
//  Ding-Timer
//
//  Created by Joel Fischer on 2/10/19.
//  Copyright © 2019 Joel Fischer. All rights reserved.
//

import UIKit

class BasicTableViewCell: FormTableViewCell<Any> {
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView?.contentMode = .scaleAspectFit
        imageView?.bounds = CGRect(x: 0, y: 0, width: 24, height: 24)
    }
}
