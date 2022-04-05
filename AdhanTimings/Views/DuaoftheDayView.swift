//
//  DuaoftheDayView.swift
//  AdhanTimings
//
//  Created by Ahmed Iyad on 2-4-22.
//

import SwiftUI

struct DuaoftheDayView: View {
    @EnvironmentObject var DuaModel:DuasViewModel
    @State var thasbeehName:String = ""
    @State var duaArabic:String = ""
    @State var duaTranslation:String? = ""
    @State var duaRef:String? = ""
    
    var body: some View {
        VStack(spacing: 20){
            Text(thasbeehName)
                .font(Font.custom("Optima Bold", size: 20))
            Text(duaArabic)
                .font(Font.custom("Al Tarikh", size: 20))
            
            if let translation = duaTranslation {
                Text(translation)
                    .font(Font.custom("Optima Bold", size: 17))
            }
            
            if let reference = duaRef {
                Text("~ \(reference) ~")
                    .font(Font.custom("Optima Bold", size: 17))
                    .padding(.vertical, 10.0)
            }
            
        }
        .onAppear{
            getRandDua()
        }
        .padding()
    }
    
    private func getRandDua() {
        var randDetails = getRandomIndex()

        var thasbeeh = DuaModel.Thasbees[randDetails.rti]
        var dua = thasbeeh.duas[randDetails.rdi]
        var duaTransCharCount = 90
        
        if let trans = dua.translation {
            duaTransCharCount = trans.count
        } else {
            duaTransCharCount = 90
        }
        
        while duaTransCharCount > 80 {
            randDetails = getRandomIndex()
            
            thasbeeh = DuaModel.Thasbees[randDetails.rti]
            dua = thasbeeh.duas[randDetails.rdi]
            duaTransCharCount = dua.arabic.unicodeScalars.count
        }
        
        self.thasbeehName = thasbeeh.name
        self.duaArabic = dua.arabic
        self.duaTranslation = dua.translation
        self.duaRef = dua.reference
        
    }
    
    private func getRandomIndex() -> (rti:Int, rdi: Int) {
        let randThasbeesIndex = Int.random(in: 0..<DuaModel.Thasbees.count)
        let randDuaIndex = Int.random(in: 0..<DuaModel.Thasbees[randThasbeesIndex].duas.count)
        
        return (rti: randThasbeesIndex, rdi: randDuaIndex)
        
    }
}

struct DuaoftheDayView_Previews: PreviewProvider {
    static var previews: some View {
        DuaoftheDayView()
            .environmentObject(DuasViewModel())
    }
}
