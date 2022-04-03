//
//  DhuasView.swift
//  AdhanTimings
//
//  Created by Ahmed Iyad on 2-4-22.
//

import SwiftUI

struct DhuasView: View {
    let duasList:[Dua]
    
    var body: some View {
        TabView {
            ForEach(duasList){ dua in
                VStack {
                    Text(dua.title)
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
            }
        }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
}

struct DhuasView_Previews: PreviewProvider {
    static var previews: some View {
        DhuasView(duasList:[Dua]())
    }
}
