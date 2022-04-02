//
//  PrayerTimeDataService.swift
//  AdhanTimings
//
//  Created by Ahmed Iyad on 2-4-22.
//

import Foundation

class PrayerTimeDataService {
    static func getData() -> [PrayerTimes] {
        // create pathString
        let pathString = Bundle.main.path(forResource: "prayer_times", ofType: "json")
        
        // create URL from pathString
        guard pathString != nil else {
            return [PrayerTimes]()
        }
        let url = URL(fileURLWithPath: pathString!)
        
        // create a data Object with url
        do {
            let data = try Data(contentsOf: url)
            
            // decode
            let jsonDecoder = JSONDecoder()
            
            do {
                let jsonDataSet = try jsonDecoder.decode([PrayerTimes].self, from: data)
                
                for item in jsonDataSet {
                    item.id = UUID()
                }
                
                return jsonDataSet
            } catch {
                // error while trying to decode
                print(error)
            }
        } catch {
            // error while creating data Object
            print(error)
        }
        
        return [PrayerTimes]()
    }
}
