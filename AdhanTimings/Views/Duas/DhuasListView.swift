//
//  DhuasListView.swift
//  AdhanTimings
//
//  Created by Ahmed Iyad on 3-4-22.
//

import SwiftUI

struct DhuasListView: View {
    @EnvironmentObject var DuaModel:DuasViewModel
    
    
    var body: some View {
        NavigationView{
            ZStack {
                Image("Background")
                    .resizable()
                    .ignoresSafeArea()
                ScrollView{
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Duas")
                            .font(Font.custom("Optima Bold", size: 30))
                        Divider()
                        
                        ForEach(DuaModel.Thasbees){ thasbeeh in
                            NavigationLink {
                                DuasSublistView(duaList: thasbeeh.duas, duaHeading: thasbeeh.name)
                            } label: {
                                Text("• \(thasbeeh.name) - \(thasbeeh.duas.count)")
                                    .font(Font.custom("Optima Regular", size: 20))
                                    .foregroundColor(Color.primary)
                                    .multilineTextAlignment(.leading)
                            }
                        }
                        
                    }
                    .padding([.leading, .bottom, .trailing])
                                              
                }
            }
            .navigationBarHidden(true)
        }
        .navigationViewStyle(.stack)
        
    }
}

struct DhuasListView_Previews: PreviewProvider {
    static var previews: some View {
        DhuasListView()
            .environmentObject(DuasViewModel())
    }
}
