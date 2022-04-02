//
//  DuasViewModel.swift
//  AdhanTimings
//
//  Created by Ahmed Iyad on 2-4-22.
//

import Foundation

class DuasViewModel: ObservableObject {
    @Published var showDhuainHome = true
    @Published var Thasbees = [ThasBees]()
    
    init (){
        self.Thasbees = DuaDataService.getData()
    }
}
