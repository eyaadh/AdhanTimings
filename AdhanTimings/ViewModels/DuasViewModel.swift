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
    
    // random dhua values for dua of the day
    @Published var thasbeehName:String = ""
    @Published var duaArabic:String = ""
    @Published var duaTranslation:String? = ""
    @Published var duaRef:String? = ""
    
    init (){
        self.Thasbees = DuaDataService.getData()
    }
    
    func getRandDua() {
        var randDetails = getRandomIndex()

        var thasbeeh = self.Thasbees[randDetails.rti]
        var dua = thasbeeh.duas[randDetails.rdi]
        var duaTransCharCount = 90
        
        if let trans = dua.translation {
            duaTransCharCount = trans.count
        } else {
            duaTransCharCount = 90
        }
        
        // loop until a dua with accepted number of characters is found
        while duaTransCharCount > 80 {
            randDetails = getRandomIndex()
            
            thasbeeh = self.Thasbees[randDetails.rti]
            dua = thasbeeh.duas[randDetails.rdi]
            
            if let trans = dua.translation {
                duaTransCharCount = trans.count
            } else {
                duaTransCharCount = 90
            }
        }
        
        self.thasbeehName = thasbeeh.name
        self.duaArabic = dua.arabic
        self.duaTranslation = dua.translation
        self.duaRef = dua.reference
        
    }
    
    private func getRandomIndex() -> (rti:Int, rdi: Int) {
        let randThasbeesIndex = Int.random(in: 0..<self.Thasbees.count)
        let randDuaIndex = Int.random(in: 0..<self.Thasbees[randThasbeesIndex].duas.count)
        
        return (rti: randThasbeesIndex, rdi: randDuaIndex)
        
    }
}
