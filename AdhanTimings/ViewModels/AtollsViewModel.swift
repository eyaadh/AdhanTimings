//
//  AtollsViewModel.swift
//  AdhanTimings
//
//  Created by Ahmed Iyad on 2-4-22.
//

import Foundation

class AtollsViewModel: ObservableObject {
    @Published var Atolls = [Atoll]()
    
    init(){
        self.Atolls = AtollsDataService.getData()
    }
    
    static func getAtoll(atollCode:String) -> Atoll {
        let dumAtolls = AtollsDataService.getData()
        
        for atoll in dumAtolls{
            if atoll.code_letter == atollCode {
                return atoll
            }
        }
        
        return Atoll()
    }
}
