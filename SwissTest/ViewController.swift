//
//  ViewController.swift
//  SwissTest
//
//  Created by Silvina Roldan on 13/02/2018.
//  Copyright © 2018 Silvina Roldan. All rights reserved.
//

import SwissEphemeris
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let swiss = SwissEphemeris(month: 4, day: 23, year: 1977, hour: 12, minutes: 41, seconds: 00)
        let test = decimalToDegree(swiss.getSunPosition())
      
    }

    func decimalToDegree(_ decimal: Double) -> String {
        var seconds = Int(decimal * 3600)
        let degrees = seconds / 3600
        seconds = abs(seconds % 3600)
        let minutes = seconds / 60
        seconds %= 60
        return String(

            format: "%d° %d ' %d",
            abs(degrees),
            minutes,
            seconds

        )
    }

    //    func format(_ duration: Double) -> String {
    //        let formatter = DateComponentsFormatter()
    //        formatter.zeroFormattingBehavior = .pad
    //        formatter.allowedUnits = [.minute, .second]
    //        if duration >= 3600 {
    //            formatter.allowedUnits.insert(.hour)
    //        }
    //        return formatter.string(from: duration)!
    //    }
}

