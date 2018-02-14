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
        let swiss = SwissEphemeris(month: 4, day: 23, year: 1977, hour: 12, minutes: 41, seconds: 0,houseType: "T", latitude:  -31.632389, longitude: -60.699459)
        let test = decimalToDegree(swiss.getSunPosition())
        let test2 = decimalToDegree(swiss.getHouse(2))
        let test3 = decimalToDegree(swiss.getHouse(3))
        let test5 = decimalToDegree(swiss.getHouse(4))
        let test6 = decimalToDegree(swiss.getHouse(5))
        let test4 = decimalToDegree(swiss.getASC())
        //let test3 = decimalToDegree(swiss.getMC())
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

