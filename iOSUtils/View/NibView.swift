//
//  NibView.swift
//  iOSUtils
//
//  Created by Daniel Martinez on 13/01/2020.
//  Copyright © 2020 com.dm. All rights reserved.
//

import UIKit

@IBDesignable
open class NibView: UIView {
  
  @IBOutlet open weak var view: UIView!
  
  override init(frame: CGRect) {
      super.init(frame: frame)
      nibSetup()
  }

  required public init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
      nibSetup()
  }
  
  private func nibSetup() {
    backgroundColor = .clear
    view = loadViewFromNib()
    view.frame = bounds
    view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    view.translatesAutoresizingMaskIntoConstraints = true
    addSubview(view)
  }
  
  func loadViewFromNib() -> UIView {
    let bundle = Bundle(for: type(of: self))
    let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
    let nibView = nib.instantiate(withOwner:self, options: nil).first as! UIView
    return nibView
  }
  
}

