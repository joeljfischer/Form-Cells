//
//  Tappable.swift
//  Ding-Timer
//
//  Created by Joel Fischer on 2/1/19.
//  Copyright © 2019 Joel Fischer. All rights reserved.
//

import UIKit

protocol FormTappable where Self: UITableViewCell {
    func tapped()
}

protocol FormPresentable where Self: UIViewController {
    var presentingCell: BasicPresenterTableViewCell? { get set }
    func willDismiss()
}
