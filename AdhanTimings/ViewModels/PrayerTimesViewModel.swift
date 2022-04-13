//
//  PrayerTimesViewModel.swift
//  AdhanTimings
//
//  Created by Ahmed Iyad on 3-4-22.
//

import Foundation

class PrayerTimesViewModel: ObservableObject {
    @Published var TodaysPrayerTimes = PrayerTimes()
    @Published var selectedIslandName:String = ""
    @Published var PrayerTimesForIsland = [PrayerTimes]()
    
    @Published var statusPrayerNotifications:Bool = false
    
    init(){
        updateTodaysPrayerTimes()
    }
    
    public func updateTodaysPrayerTimes(locationIndex:Int = IslandsViewMode().locationIndex) {
        let islandObj = IslandsViewMode().Islands[locationIndex]
        let locationReg = islandObj.reg_no
        let atollCode = islandObj.atoll_code
        let atollObj = AtollsViewModel.getAtoll(atollCode: atollCode)
        
        self.selectedIslandName = "\(atollObj.name_abbr_en) \(islandObj.name_en)"
        
        if self.PrayerTimesForIsland.count > 0 {
            self.PrayerTimesForIsland = [PrayerTimes]()
        }
        
        
        let prayerTimesList = PrayerTimeDataService.getData()
        
        for prayerTime in prayerTimesList{
            if prayerTime.island_reg == locationReg {
                self.PrayerTimesForIsland.append(prayerTime)
            }
        }
        
        if self.PrayerTimesForIsland.count > 0 {
            let thisMonth = Calendar.current.component(.month, from: Date())
            let thisDay = Calendar.current.component(.day, from: Date())
            
            for prayerTime in PrayerTimesForIsland {
                if (prayerTime.day == String(thisDay)) && (prayerTime.month == String(thisMonth)) {
                    self.TodaysPrayerTimes = prayerTime
                }
            }
        }
        
    }
}
