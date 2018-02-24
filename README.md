# SwissEphemeris
[![Swift 4.0.x](https://img.shields.io/badge/Swift-4.0.x-orange.svg?style=flat)](https://swift.org/)
[![GitHub issues](https://img.shields.io/github/issues/silvinaroldan/SwissEphemeris.svg)](https://github.com/silvinaroldan/SwissEphemeris/issues)  [![License: GPL v2](https://img.shields.io/badge/License-GPL%20v2-blue.svg)](https://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html)

            
Swiss Ephemeris iOS Framework

This Project contains two targets to test the Framework  on iOS Apps

## Consuming the Framework from a Swift App

### 
```swift
//UTC Time - Topocentric System House

let swiss = SwissEphemeris(month: 5, day: 23, year: 1985, hour: 11, minutes: 40, seconds: 0, houseType: "T", latitude: -31.632389, longitude: -60.699459)

let sunPosition = swiss.getSunPosition()
let firstHousePosition = swiss.getHouse(1)

print("First house position: " + firstHousePosition + " Sun Position: " + sunPosition)
```


## Swiss Ephemeris Resources and Documentation
[Programming interface](http://www.astro.com/swisseph/swephprg.htm) to the Swiss Ephemeris for more details

You can use the [Test Swiss Ephemeris Page](http://www.astro.com/swisseph/swetest.htm) for data comparison like this:

<img width="679" alt="ephemeristestpage3" src="https://user-images.githubusercontent.com/8246422/36180307-92b8befc-10fe-11e8-8b52-5ea32f7dd675.png">

[Download Ephemeris](http://www.astro.com/ftp/swisseph/)

## Feedback

Please feel free to fill [issues](http://github.com/silvinaroldan/SwissEphemeris/issues) for bugs, erros and features.

## License

The license for this project is the same as original [Swiss Ephemeris](http://www.astro.com/swisseph/swephinfo_e.htm)