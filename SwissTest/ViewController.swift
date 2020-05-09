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
        let swiss = SwissEphemeris(month: 5, day: 23, year: 1985, hour: 12, minutes: 41, seconds: 0, houseType: "T", latitude: -31.632389, longitude: -60.699459)

        let firstHousePosition = swiss.housePosition(1)
        let sunPosition = swiss.sunPosition()

        let equatorialCoordinatesForSun = swiss.getEquatorialCoordinatesFor(Planet.sun.rawValue)

        print("First house position: \(firstHousePosition). Sun Position: \(sunPosition)")
        print("Equatorial coordinates for the sun. Right Ascencional: \(equatorialCoordinatesForSun.0). Declination: \(equatorialCoordinatesForSun.1)")
    }
}

