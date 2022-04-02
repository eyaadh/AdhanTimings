//
//  AtollsDataService.swift
//  AdhanTimings
//
//  Created by Ahmed Iyad on 2-4-22.
//

import Foundation

class AtollsDataService{
    static func getData() -> [Atoll] {
        // create pathString
        let pathString = Bundle.main.path(forResource: "atolls", ofType: "json")
        
        // create URL from the pathString
        guard pathString != nil else {
            return [Atoll]()
        }
        let url = URL(fileURLWithPath: pathString!)
        
        // create data Object from URL
        
        do {
            let data = try Data(contentsOf: url)
            
            let jsonDecoder = JSONDecoder()
            
            // decode the data
            do {
                let jsonDataSet = try jsonDecoder.decode([Atoll].self, from: data)
                
                for item in jsonDataSet {
                    item.id = UUID()
                }
                
                return jsonDataSet
            } catch {
                // error while trying to decode data
                print(error)
            }
        } catch {
            // error while trying to create Data Object
            print(error)
        }
        
        return[Atoll]()
    }
}
