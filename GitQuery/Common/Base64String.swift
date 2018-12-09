//
//  Base64String.swift
//  GitQuery
//
//  Created by Maruf Nebil Ogunc on 9.12.2018.
//  Copyright © 2018 Maruf Nebil Ogunc. All rights reserved.
//

import Foundation

extension String{
    func base64String() -> String {
        let data = self.data(using: String.Encoding.utf8)
        let base64 = data!.base64EncodedString(options: Data.Base64EncodingOptions(rawValue: 0))
        return base64
    }
}


