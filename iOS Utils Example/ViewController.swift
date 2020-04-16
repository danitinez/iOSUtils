//
//  ViewController.swift
//  iOS Utils Example
//
//  Created by Daniel Martinez on 16/04/2020.
//  Copyright © 2020 com.dm. All rights reserved.
//

import UIKit
import iOSUtils

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }

  
  @IBAction func onTestAlertInput() {
    UIAlertController.showGlobalInputAlert(title: "Test input",
                                           message: "This is a message",
                                           configHandler: {txtField in
                                            txtField.keyboardType = .numberPad
                                           }) { action, controller in
                                            let txt = controller.textFields![0]
                                            print(txt.text ?? "")
    }
  }

}

