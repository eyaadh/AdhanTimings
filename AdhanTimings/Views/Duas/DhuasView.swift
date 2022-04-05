//
//  DhuasView.swift
//  AdhanTimings
//
//  Created by Ahmed Iyad on 2-4-22.
//

import SwiftUI

struct DhuasView: View {
    @EnvironmentObject var DuaModel:DuasViewModel
    
    let dua:Dua
    
    var body: some View {
        ScrollView{
            ZStack{
                Image("bg1")
                    .resizable()
                    .ignoresSafeArea()
                VStack (spacing: 20.0) {
                    Text(dua.title)
                        .font(Font.custom("Optima Bold", size: 30))
                        .padding(.top, 60.0)
                        
                    Text(dua.arabic)
                        .font(Font.custom("Al Tarikh", size: 30))
                        .shadow(color: .gray, radius: 10.0, x: 1, y: 1)
                    
                    if let translation = dua.translation {
                        Text(translation)
                            .font(Font.custom("Optima Bold", size: 20))
                    }
                    
                    if let reference = dua.reference {
                        Text("~ \(reference) ~")
                            .font(Font.custom("Optima Bold", size: 20))
                    }
                    Spacer()
                    

                }
                .padding()
            }
        }
    }
}

struct DhuasView_Previews: PreviewProvider {
    static var previews: some View {
        DhuasView(dua:DuasViewModel().Thasbees[1].duas[0])
            .environmentObject(DuasViewModel())
    }
}
