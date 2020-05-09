//
//  SwissEphemerisService.swift
//  SwissEphemeris
//
//  Created by Silvina Roldan on 31/12/2019.
//  Copyright © 2019 Silvina Roldan. All rights reserved.
//

import Foundation
import SwissEph

public enum Planet: Int {
    case sun
    case moon
    case mercury
    case venus
    case mars
    case jupiter
    case saturn
    case uranus
    case neptune
    case pluto
    case meanNode
    case trueNode
    case meanApog
    case oscuApog
    case earth
    case chiron
    case pholus
    case ceres
    case palas
    case juno
    case vesta
}

public class SwissEphemeris {
    
    private let day: Int
    private let month: Int
    private let year: Int
    private let hour: Int
    private let minutes: Int
    private let seconds: Int
    private let houseType: Character
    private let longitude: Double
    private let latitude: Double

    private var julianDay: Double {
        let times: UnsafeMutablePointer<Double> = UnsafeMutablePointer.allocate(capacity: 2)
        swe_utc_to_jd(int32(year), int32(month), int32(day), int32(hour), int32(minutes), Double(seconds), SE_GREG_CAL, times, nil)
        return times[1]
    }

    public var equatorialFlag: Int32 = SEFLG_SWIEPH | SEFLG_SPEED | SEFLG_EQUATORIAL

    public init(month: Int, day: Int, year: Int, hour: Int, minutes: Int,
                seconds: Int, houseType: Character, latitude: Double,
                longitude: Double) {
        self.day = day
        self.month = month
        self.year = year
        self.hour = hour
        self.minutes = minutes
        self.seconds = seconds
        self.houseType = houseType
        self.longitude = longitude
        self.latitude = latitude
    }

    public func getSunPosition() -> Double {
        return getPositionFor(Planet.sun.rawValue)
    }

    public func getMoonPosition() -> Double {
        return getPositionFor(Planet.moon.rawValue)
    }

    public func getMercuryPosition() -> Double {
        return getPositionFor(Planet.mercury.rawValue)
    }

    public func getVenusPosition() -> Double {
        return getPositionFor(Planet.venus.rawValue)
    }

    public func getMarsPosition() -> Double {
        return getPositionFor(Planet.mars.rawValue)
    }

    public func getUranusPosition() -> Double {
        return getPositionFor(Planet.uranus.rawValue)
    }

    public func getNeptunePosition() -> Double {
        return getPositionFor(Planet.neptune.rawValue)
    }

    public func getPlutoPosition() -> Double {
        return getPositionFor(Planet.pluto.rawValue)
    }

    public func getHouse(_ cuspid: Int) -> Double {
        let cusp = houseCusp()
        return cusp.0[cuspid]
    }

    public func sunPosition() -> String {
        return getSunPosition().decimalToDegree()
    }

    public func marsPosition() -> String {
        return getMarsPosition().decimalToDegree()
    }

    public func housePosition(_ cuspid: Int) -> String {
        return getHouse(cuspid).decimalToDegree()
    }

    public func getEquatorialCoordinatesFor(_ planet: Int) -> (Double, String) {
        let positions: UnsafeMutablePointer<Double> = UnsafeMutablePointer.allocate(capacity: 6)
        swe_calc(julianDay, Int32(planet), equatorialFlag, positions, nil)
        return (positions[0], positions[1].decimalToDegree())
    }

    private func houseCusp() -> (UnsafeMutablePointer<Double>, UnsafeMutablePointer<Double>) {
        let cuspids: UnsafeMutablePointer<Double> = UnsafeMutablePointer.allocate(capacity: 13)
        let aSCMC: UnsafeMutablePointer<Double> = UnsafeMutablePointer.allocate(capacity: 10)
        swe_houses(julianDay, latitude, longitude, Int32(houseType.asciiValue), cuspids, aSCMC)
        return (cuspids, aSCMC)
    }

    private func getPositionFor(_ planet: Int) -> Double {
        let positions: UnsafeMutablePointer<Double> = UnsafeMutablePointer.allocate(capacity: 6)
        swe_calc(julianDay, Int32(planet), SEFLG_SWIEPH, positions, nil)
        return positions[0]
    }
}

