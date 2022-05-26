//
//  String+AdOns.swift
//  iOSUtils
//
//  Created by Daniel Martinez on 13/12/2019.
//  Copyright © 2019 com.dm. All rights reserved.
//

import Foundation


public extension String {
  var urlEscaped: String {
      return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
  }

  var utf8Encoded: Data {
      return data(using: .utf8)!
  }
  
  var isPhoneNumber: Bool {
      do {
          let detector = try NSDataDetector(types: NSTextCheckingResult.CheckingType.phoneNumber.rawValue)
          let matches = detector.matches(in: self, options: [], range: NSMakeRange(0, self.count))
          if let res = matches.first {
              return res.resultType == .phoneNumber && res.range.location == 0 && res.range.length == self.count
          } else {
              return false
          }
      } catch {
          return false
      }
  }
}
