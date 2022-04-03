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
        NavigationView {
            ScrollView{
                VStack(alignment: .leading, spacing: 10) {
                    Text("Duas")
                        .font(Font.custom("Avenir Heavy", size: 20))
                    
                    ForEach(DuaModel.Thasbees){ thasbeeh in
                        NavigationLink {
                            DhuasView(duasList: thasbeeh.duas)
                        } label: {
                            Text("• \(thasbeeh.name) - \(thasbeeh.duas.count)")
                                .font(Font.custom("Avenir Light", size: 17))
                                .multilineTextAlignment(.leading)
                                .foregroundColor(.black)
                            
                        }
                    }
                    
                }.padding()
            }.navigationBarHidden(true)
        }
    }
}

struct DhuasListView_Previews: PreviewProvider {
    static var previews: some View {
        DhuasListView()
            .environmentObject(DuasViewModel())
    }
}
