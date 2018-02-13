//
//  SwissEphemeris.swift
//  SwissEphemeris
//
//  Created by Silvina Roldan on 11/02/2018.
//  Copyright © 2018 Silvina Roldan. All rights reserved.
//

/*************** swe_julday ********************************************
 * This function returns the absolute Julian day number (JD)
 * for a given calendar date.
 * The arguments are a calendar date: day, month, year as integers,
 * hour as double with decimal fraction.
 * If gregflag = SE_GREG_CAL (1), Gregorian calendar is assumed,
 * if gregflag = SE_JUL_CAL (0),Julian calendar is assumed.
 ************************************************************************/

import SwissEph
import UIKit

public class SwissEphemeris {

    public var day: Int
    public var month: Int
    public var year: Int
    public var hour: Double
    
    public init(day:Int, month:Int, year:Int, hour:Double) {
        self.day = day
        self.month = month
        self.year = year
        self.hour = hour
    }
    
    public func sunPosition() -> Double {
//        let s = Bundle.main.bundlePath
//        let cs = (s as NSString).utf8String
//        let buffer = UnsafeMutablePointer<Int8>(mutating: cs)
//        swe_set_ephe_path(buffer)
        
//        swe_set_topo(
//            -58.381592    ,
//            -34.603722,
//        )
        //hour =  hourToSeconds(hour: 9, minutes: 40, seconds: 0)
        
        var julianDay = swe_julday(Int32(year), Int32(month), Int32(day), hour, 1)
        let delta = swe_deltat(julianDay)
        let jul_day_ET = julianDay + delta
        let DPointer: UnsafeMutablePointer<Double> = UnsafeMutablePointer.allocate(capacity: 6)
        
        //let flag = SEFLG_SWIEPH | SEFLG_TOPOCTR
        
        let dretPointer: UnsafeMutablePointer<Double> = UnsafeMutablePointer.allocate(capacity: 2)
        swe_utc_to_jd(1977, 4, 23, 12, 41, 0, 1, dretPointer, nil)
        
        
        swe_calc(dretPointer[1], SE_SUN, SEFLG_SWIEPH, DPointer, nil)
        return DPointer[0] 
    }
    
    public func sunPositionString() -> String {
        return decimalToDegree(sunPosition())
    }
    
    public func SWE_CALC() -> UnsafeMutablePointer<Double> {
        
        let julianDay = swe_julday(Int32(year), Int32(month), Int32(day), hour, 1)
        let DPointer: UnsafeMutablePointer<Double> = UnsafeMutablePointer.allocate(capacity: 6)
        swe_calc(julianDay, SE_SUN, SEFLG_SWIEPH, DPointer, nil)
        return DPointer
    }
    
    public func houseCusp() -> UnsafeMutablePointer<Double> {
        let julianDay = swe_julday(Int32(year), Int32(month), Int32(day), hour, 1)
        let cuspPointer: UnsafeMutablePointer<Double> = UnsafeMutablePointer.allocate(capacity: 13)
        let ascMCPointer: UnsafeMutablePointer<Double> = UnsafeMutablePointer.allocate(capacity: 10)
    
        swe_houses(julianDay, -34.6131500, -58.3772300, Int32(Character("P").asciiValue), cuspPointer, ascMCPointer)
        
        return cuspPointer
    }
    
    func coordinateString(_ latitude: Double,_ longitude: Double) -> String {
        var latSeconds = Int(latitude * 3600)
        let latDegrees = latSeconds / 3600
        latSeconds = abs(latSeconds % 3600)
        let latMinutes = latSeconds / 60
        latSeconds %= 60
        var longSeconds = Int(longitude * 3600)
        let longDegrees = longSeconds / 3600
        longSeconds = abs(longSeconds % 3600)
        let longMinutes = longSeconds / 60
        longSeconds %= 60
        return String(format:"%d°%d'%d\"%@ %d°%d'%d\"%@",
                      abs(latDegrees),
                      latMinutes,
                      latSeconds, latDegrees >= 0 ? "N" : "S",
                      abs(longDegrees),
                      longMinutes,
                      longSeconds,
                      longDegrees >= 0 ? "E" : "W" )
    }
    
    func decimalToDegree(_ decimal: Double) -> String{
        var seconds = Int(decimal * 3600)
        let degrees = seconds / 3600
        seconds = abs(seconds % 3600)
        let minutes = seconds / 60
        seconds %= 60
        return String(
            
            format: "%d° %d %d",
            abs(degrees),
            minutes,
            seconds
            
        )

    }
    
    
    
    
}
