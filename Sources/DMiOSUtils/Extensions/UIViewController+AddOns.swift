//
//  UIViewController+AddOns.swift
//  iOSUtils
//  From https://stackoverflow.com/questions/24126678/close-ios-keyboard-by-touching-anywhere-using-swift
//  Created by Daniel Martinez on 16/12/2019.
//  Copyright © 2019 com.dm. All rights reserved.
//

import UIKit

// Put this piece of code anywhere you like
public extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
