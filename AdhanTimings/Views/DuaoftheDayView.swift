//
//  DuaoftheDayView.swift
//  AdhanTimings
//
//  Created by Ahmed Iyad on 2-4-22.
//

import SwiftUI

struct DuaoftheDayView: View {
    @EnvironmentObject var DuaModel:DuasViewModel
    
    
    var body: some View {
        let randThasbeesIndex = Int.random(in: 0..<DuaModel.Thasbees.count)
        let randDuaIndex = Int.random(in: 0..<DuaModel.Thasbees[randThasbeesIndex].duas.count)
        
        let thasbeeh = DuaModel.Thasbees[randThasbeesIndex]
        let dua = thasbeeh.duas[randDuaIndex]
        
        VStack(spacing: 10){
            Text(thasbeeh.name)
                .font(Font.custom("Avenir Heavy", size: 20))
            Text(dua.arabic)
                .font(Font.custom("Al Tarikh", size: 20))
            if let translation = dua.translation {
                Text(translation)
                    .font(Font.custom("Avenir Light", size: 17))
            }
            
            if let reference = dua.reference {
                Text("~ \(reference) ~")
                    .font(Font.custom("Avenir Light", size: 17))
                    .padding(.vertical, 10.0)
            }
            
        }.padding()
    }
}

struct DuaoftheDayView_Previews: PreviewProvider {
    static var previews: some View {
        DuaoftheDayView()
            .environmentObject(DuasViewModel())
    }
}
