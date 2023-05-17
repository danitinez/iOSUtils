import UIKit

public extension UIColor {
  
  var readableTextColor: UIColor {
    let components = self.cgColor.components!
    let brightness = ((components[0] * 299) + (components[1] * 587) + (components[2] * 114)) / 1000
    return brightness > 0.5 ? .black : .white
  }
  
  convenience init(red: Int, green: Int, blue: Int) {
    assert(red >= 0 && red <= 255, "Invalid red component")
    assert(green >= 0 && green <= 255, "Invalid green component")
    assert(blue >= 0 && blue <= 255, "Invalid blue component")
    
    self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
  }
  
  convenience init(rgb: Int) {
    self.init(
      red: (rgb >> 16) & 0xFF,
      green: (rgb >> 8) & 0xFF,
      blue: rgb & 0xFF
    )
  }
  
}

