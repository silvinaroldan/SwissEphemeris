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
        
        // UTC time - Topocentric System house
        let swiss = SwissEphemeris(month: 4, day: 23, year: 1977, hour: 12, minutes: 41, seconds: 0,houseType: "T", latitude:  -31.632389, longitude: -60.699459)
        let sunPosition = decimalToDegree(swiss.getSunPosition())
        let firstHousePosition = decimalToDegree(swiss.getHouse(1))
        print("First house position: " + firstHousePosition + " Sun Position: " + sunPosition)
    }

    private func decimalToDegree(_ decimal: Double) -> String {
        var seconds = Int(decimal * 3600)
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

