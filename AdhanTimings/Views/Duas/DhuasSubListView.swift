//
//  DhuasSubListView.swift
//  AdhanTimings
//
//  Created by Ahmed Iyad on 3-4-22.
//

import SwiftUI

struct DhuasSubListView: View {
    let subDhuaList:[Dua]
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(subDhuaList){Dua in
                    Text(Dua.reference!)
                        .font(Font.custom("Avenir Heavy", size: 20))
                }
            }
        }
    }
}

struct DhuasSubListView_Previews: PreviewProvider {
    static var previews: some View {
        DhuasSubListView(subDhuaList:[Dua]())
    }
}
