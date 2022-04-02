//
//  IslandDataService.swift
//  AdhanTimings
//
//  Created by Ahmed Iyad on 2-4-22.
//

import Foundation

class IslandsDataService {
    static func getData() -> [Island] {
        // create pathString
        let pathString = Bundle.main.path(forResource: "islands", ofType: "json")
        
        // create URL
        guard pathString != nil else {
            return [Island]()
        }
        
        let url = URL(fileURLWithPath: pathString!)
        
        // create dataObject
        do {
            let data = try Data(contentsOf: url)
            
            let jsonDecoder = JSONDecoder()
            
            do {
                let jsonDataSet = try jsonDecoder.decode([Island].self, from: data)
                
                for item in jsonDataSet {
                    item.id = UUID()
                }
                
                return jsonDataSet
            } catch {
               // error while trying to decode jsondata
                print(error)
            }
        } catch {
            //error while trying to formulate dataObject
            print(error)
        }
        
        return [Island]()
    }
}
