//
//  ViewController.swift
//  SwissTest
//
//  Created by Silvina Roldan on 13/02/2018.
//  Copyright © 2018 Silvina Roldan. All rights reserved.
//

import UIKit
import SwissEphemeris

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let hour = hourToSeconds(hour: 1, minutes: 0, seconds: 0)
        let swiss = SwissEphemeris(day: 23, month: 4, year: 1977, hour: 12.41)
        let sun = swiss.sunPositionString()
        let sun2 = swiss.sunPosition()
        let test = format(hour)
        let house = swiss.houseCusp()
        print(sun)
    }

    func hourToSeconds(hour: Int, minutes: Int, seconds: Int) -> Double {
        return Double(seconds + minutes * 60 + hour * 3600)
    }

    func format(_ duration: Double) -> String {
        let formatter = DateComponentsFormatter()
        formatter.zeroFormattingBehavior = .pad
        formatter.allowedUnits = [.minute, .second]
        
        if duration >= 3600 {
            formatter.allowedUnits.insert(.hour)
        }
        
        return formatter.string(from: duration)!
    }



}

