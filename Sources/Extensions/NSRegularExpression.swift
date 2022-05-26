//
//  NSRegularExpression.swift
//  iOSUtils
//
//  Created by Daniel Martinez on 20/03/2020.
//  Copyright © 2020 com.dm. All rights reserved.
//

import Foundation

public extension NSRegularExpression {
    func matches(_ string: String) -> Bool {
        let range = NSRange(location: 0, length: string.utf16.count)
        return firstMatch(in: string, options: [], range: range) != nil
    }
}
