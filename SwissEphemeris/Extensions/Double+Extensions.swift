//
//  Double+Extensions.swift
//  SwissEphemeris
//
//  Created by Silvina Roldan on 31/12/2019.
//  Copyright © 2019 Silvina Roldan. All rights reserved.
//

import Foundation

extension Double {

    func decimalToDegree() -> String {
        var seconds = Int(self * 3600)
        let degrees = seconds / 3600
        seconds = abs(seconds % 3600)
        let minutes = seconds / 60
        seconds %= 60
        return String(
            format: "%d° %d' %d\"",
            abs(degrees),
            minutes,
            seconds
        )
    }

}
