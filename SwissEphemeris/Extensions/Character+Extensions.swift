//
//  Extensions.swift
//  SwissEphemeris
//
//  Created by Silvina Roldan on 13/02/2018.
//  Copyright © 2018 Silvina Roldan. All rights reserved.
//

import UIKit

extension Character {
    
    var asciiValue: Int {
        get {
            let s = String(self).unicodeScalars
            return Int(s[s.startIndex].value)
        }
    }
}
