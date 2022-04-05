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
        VStack(spacing: 20){
            Text(DuaModel.thasbeehName)
                .font(Font.custom("Optima Bold", size: 20))
            Text(DuaModel.duaArabic)
                .font(Font.custom("Al Tarikh", size: 20))
            
            if let translation = DuaModel.duaTranslation {
                Text(translation)
                    .font(Font.custom("Optima Bold", size: 17))
            }
            
            if let reference = DuaModel.duaRef {
                Text("~ \(reference) ~")
                    .font(Font.custom("Optima Bold", size: 17))
                    .padding(.vertical, 10.0)
            }
            
        }
        .onAppear{
            DuaModel.getRandDua()
        }
        .padding()
    }
}

struct DuaoftheDayView_Previews: PreviewProvider {
    static var previews: some View {
        DuaoftheDayView()
            .environmentObject(DuasViewModel())
    }
}
