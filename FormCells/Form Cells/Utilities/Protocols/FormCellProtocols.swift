//
//  Tappable.swift
//  Ding-Timer
//
//  Created by Joel Fischer on 2/1/19.
//  Copyright © 2019 Joel Fischer. All rights reserved.
//

import UIKit

protocol FormDataRetrievable: AnyObject {
    var data: Any { get set }
}

protocol FormTappable: AnyObject {
    func tapped()
}

protocol FormTapCallbackable: FormTappable {
    var onSelection: (() -> Void)? { get set }
}

protocol FormPresentable where Self: UIViewController {
    var presentingCell: BasicPresenterTableViewCell? { get set }
    func willDismiss()
}

extension FormPresentable {
    func willDismiss() { }
}
