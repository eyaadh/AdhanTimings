//
//  DuasSublistView.swift
//  AdhanTimings
//
//  Created by Ahmed Iyad on 5-4-22.
//

import SwiftUI

struct DuasSublistView: View {
    @State var isPresented = false
    
    var duaList:[Dua]
    var duaHeading:String
    
    var body: some View {
        ZStack {
            Image("Background")
                .resizable()
                .ignoresSafeArea()
            ScrollView {
                VStack(alignment: .leading, spacing: 15) {
                    Divider()
                    ForEach(duaList){ dua in
                        Button {
                            isPresented = true
                        } label: {
                            if let reference = dua.reference {
                                Text("• \(reference)")
                                    .font(Font.custom("Optima Regular", size: 20))
                                    .foregroundColor(Color.primary)
                            } else {
                                Text("• \(dua.title)")
                                    .font(Font.custom("Optima Regular", size: 20))
                                    .foregroundColor(Color.primary)
                            }
                            
                        }
                        .sheet(isPresented: $isPresented) {
                            DhuasView(dua: dua)
                            
                        }

                    }
                    
                    Spacer()
                    
                }.padding()
            }
            
        }
        .navigationTitle(Text(duaHeading)
                .font(Font.custom("Optima Bold", size: 30)))
        .navigationBarTitleDisplayMode(.automatic)

    }
}

struct DuasSublistView_Previews: PreviewProvider {
    static var previews: some View {
        DuasSublistView(duaList:DuasViewModel().Thasbees[6].duas, duaHeading: DuasViewModel().Thasbees[6].name)
            .environmentObject(DuasViewModel())
    }
}
