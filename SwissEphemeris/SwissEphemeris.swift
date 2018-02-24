//
//  SwissEphemeris.swift
//  SwissEphemeris
//
//  Created by Silvina Roldan on 11/02/2018.
//  Copyright © 2018 Silvina Roldan. All rights reserved.
//

import SwissEph
import UIKit

public class SwissEphemeris {
    
    public var day: Int
    public var month: Int
    public var year: Int
    public var hour: Int
    public var minutes: Int
    public var seconds: Int
    public var houseType: Character
    public var longitude: Double
    public var latitude: Double
    
    public init(month: Int, day: Int, year: Int, hour: Int, minutes: Int, seconds: Int, houseType: Character, latitude: Double, longitude: Double) {
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
        return getPositionFor(Int(SE_SUN))
    }
    
    public func getMoonPosition() -> Double {
        return getPositionFor(Int(SE_MOON))
    }
    
    public func getMercuryPosition() -> Double {
        return getPositionFor(Int(SE_MERCURY))
    }
    
    public func getVenusPosition() -> Double {
        return getPositionFor(Int(SE_VENUS))
    }
    
    public func getMarsPosition() -> Double {
        return getPositionFor(Int(SE_MARS))
    }
    
    public func getUranusPosition() -> Double {
        return getPositionFor(Int(SE_URANUS))
    }
    
    public func getNeptunePosition() -> Double {
        return getPositionFor(Int(SE_NEPTUNE))
    }
    
    public func getPlutoPosition() -> Double {
        return getPositionFor(Int(SE_PLUTO))
    }
    
    public func getHouse(_ cuspid: Int) -> Double {
        let cusp = houseCusp()
        return cusp.0[cuspid]
    }
    
    private func houseCusp() -> (UnsafeMutablePointer<Double>, UnsafeMutablePointer<Double>) {
        let julianDay = getJulianDay()
        let cuspids: UnsafeMutablePointer<Double> = UnsafeMutablePointer.allocate(capacity: 13)
        let aSCMC: UnsafeMutablePointer<Double> = UnsafeMutablePointer.allocate(capacity: 10)
        swe_houses(julianDay, latitude, longitude, Int32(houseType.asciiValue), cuspids, aSCMC)
        return (cuspids, aSCMC)
    }
    
    private func getJulianDay() -> Double {
        let times: UnsafeMutablePointer<Double> = UnsafeMutablePointer.allocate(capacity: 2)
        swe_utc_to_jd(int32(year), int32(month), int32(day), int32(hour), int32(minutes), Double(seconds), SE_GREG_CAL, times, nil)
        return times[1]
    }
    
    private func getPositionFor(_ planet: Int) -> Double {
        let julianDay = getJulianDay()
        let positions: UnsafeMutablePointer<Double> = UnsafeMutablePointer.allocate(capacity: 6)
        swe_calc(julianDay, Int32(planet), SEFLG_SWIEPH, positions, nil)
        return positions[0]
    }
}

