import UIKit

extension UIColor {
  
  public var readableTextColor: UIColor {
    let components = self.cgColor.components!
    let brightness = ((components[0] * 299) + (components[1] * 587) + (components[2] * 114)) / 1000
    return brightness > 0.5 ? .black : .white
  }
  
}

