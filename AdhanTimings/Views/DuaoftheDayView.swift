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
        VStack(spacing: 10){
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
        let randThasbeesIndex = Int.random(in: 0..<DuaModel.Thasbees.count)
        let randDuaIndex = Int.random(in: 0..<DuaModel.Thasbees[randThasbeesIndex].duas.count)
        
        let thasbeeh = DuaModel.Thasbees[randThasbeesIndex]
        let dua = thasbeeh.duas[randDuaIndex]
        
        self.thasbeehName = thasbeeh.name
        self.duaArabic = dua.arabic
        self.duaTranslation = dua.translation
        self.duaRef = dua.reference
        
    }
}

struct DuaoftheDayView_Previews: PreviewProvider {
    static var previews: some View {
        DuaoftheDayView()
            .environmentObject(DuasViewModel())
    }
}
