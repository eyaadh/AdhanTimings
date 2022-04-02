//
//  PrayerTimesDataModel.swift
//  AdhanTimings
//
//  Created by Ahmed Iyad on 2-4-22.
//

import Foundation

class PrayerTimes: Identifiable, Decodable {
    var id:UUID?
    var day:String = ""
    var month:String = ""
    var island_reg:String = ""
    var fajr:String = ""
    var sunrise:String = ""
    var duhr:String = ""
    var asr:String = ""
    var maghrib:String = ""
    var isha:String = ""
}
