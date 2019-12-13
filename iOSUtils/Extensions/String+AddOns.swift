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
}
