//
//  DhuasView.swift
//  AdhanTimings
//
//  Created by Ahmed Iyad on 2-4-22.
//

import SwiftUI

struct DhuasView: View {
    @EnvironmentObject var DuaModel:DuasViewModel
    
    var randColor: Color {
        return Color(.sRGB,
                     red: Double.random(in: 0...1),
                     green: Double.random(in: 0...1),
                     blue: Double.random(in: 0...1),
            opacity: 1.0)
    }
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Duas")
                .font(Font.custom("Avenir Heavy", size: 20))
            TabView {
                
                ForEach(DuaModel.Thasbees){ thasbeeh in
                    ForEach(thasbeeh.duas){ dua in
                        
                        GeometryReader { geo in
                            ZStack {
                                Image("background")
                                    .resizable()
                                    .frame(width: geo.size.width, height: geo.size.height)
                                    .cornerRadius(20)
                                    
                                    
                                    
                                VStack {
                                    Text(thasbeeh.name)
                                        .font(Font.custom("Avenir Heavy", size: 20))
                                        .padding(.vertical, 2.0)
                                        
                                    Text(dua.arabic)
                                        .font(Font.custom("Al Tarikh", size: 20))
                                        .padding(.vertical, 2.0)
                                        .shadow(color: .gray, radius: 10.0, x: 1, y: 1)
                                    
                                    if let translation = dua.translation {
                                        Text(translation)
                                            .font(Font.custom("Avenir Light", size: 17))
                                            .padding(.vertical, 10.0)
                                    }
                                    
                                    if let reference = dua.reference {
                                        Text("~ \(reference) ~")
                                            .font(Font.custom("Avenir Light", size: 17))
                                            .padding(.vertical, 10.0)
                                    }
                                    
                                    

                                }.tabItem({
                                       //
                                })
                                .padding()
                                .frame(width: geo.size.width, height: geo.size.height)
                            }
                        }
                        
                        
                            
                    }
                }
                
                
            }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                
        }
        .padding()
    }
}

struct DhuasView_Previews: PreviewProvider {
    static var previews: some View {
        DhuasView()
            .environmentObject(DuasViewModel())
    }
}
