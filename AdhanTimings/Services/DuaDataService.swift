//
//  DuaDataService.swift
//  AdhanTimings
//
//  Created by Ahmed Iyad on 2-4-22.
//

import Foundation

class DuaDataService {
    static func getData() -> [ThasBees] {
        // define a path String
        let pathString = Bundle.main.path(forResource: "duas", ofType: "json")
        
        // crete the URL
        guard pathString != nil else {
            return [ThasBees]()
        }
        let url = URL(fileURLWithPath: pathString!)
        
        // create the data Object
        do {
            let data = try Data(contentsOf: url)
            
            let jsonDecoder = JSONDecoder()
            
            do {
                let jsonDataSet = try jsonDecoder.decode([ThasBees].self, from: data)
                
                // add unique ID to data
                for item in jsonDataSet{
                    item.id = UUID()
                    for dua in item.duas {
                        dua.id = UUID()
                    }
                }
                
                return jsonDataSet
            } catch {
                // error while decoding data
                print(error)
            }
        } catch {
            // error while creating the data object
            print(error)
        }
        
        return [ThasBees]()
    }
}
