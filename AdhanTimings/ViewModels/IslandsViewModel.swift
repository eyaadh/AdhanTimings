//
//  IslandsViewModel.swift
//  AdhanTimings
//
//  Created by Ahmed Iyad on 2-4-22.
//

import Foundation

class IslandsViewMode: ObservableObject {
    @Published var Islands = [Island]()
    @Published var locationIndex = 193 // 193 K.Male in default
    
    init () {
        self.Islands = IslandsDataService.getData()
    }
}