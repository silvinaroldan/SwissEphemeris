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
        let swiss = SwissEphemeris(day: 23, month: 4, year: 1977, hour: 0)
        let sun = swiss.sunPositionString()
        let sun2 = swiss.sunPosition()
        let house = swiss.houseCusp()
        print(sun)
    }

   


}

