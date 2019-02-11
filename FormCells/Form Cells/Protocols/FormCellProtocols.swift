//
//  Tappable.swift
//  Ding-Timer
//
//  Created by Joel Fischer on 2/1/19.
//  Copyright © 2019 Joel Fischer. All rights reserved.
//

import UIKit

protocol FormDataRetrievable where Self: UITableViewCell {
    var data: Any { get set }
}

protocol FormTappable where Self: UITableViewCell {
    func tapped()
}

protocol FormTapCallbackable where Self: FormTappable {
    var onSelection: ((FormTapCallbackable) -> Void)? { get set }
}

protocol FormPresentable where Self: UIViewController {
    var presentingCell: BasicPresenterTableViewCell? { get set }
    func willDismiss()
}
