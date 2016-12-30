//
//  AlertViewConviniences.swift
//  SwiftToolbox
//
//  Created by Ben Davis on 30/12/2016.
//  Copyright © 2016 bendavisapps. All rights reserved.
//

import UIKit

public extension UIViewController {
    public func showAlert(withTitle title: String? = nil, message: String? = nil, buttonTitle: String? = "OK") {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: buttonTitle, style: .cancel))
        present(alertController, animated: true)
    }
}
