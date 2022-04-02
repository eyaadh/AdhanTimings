//
//  SettingsView.swift
//  AdhanTimings
//
//  Created by Ahmed Iyad on 2-4-22.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var DuaModel:DuasViewModel
    @EnvironmentObject var IslandModel:IslandsViewMode
    @EnvironmentObject var AtollModel:AtollsViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading){
                // MARK: Show Dua of the Day Home Screen
                Text("Settings")
                    .font(Font.custom("Avenir Heavy", size: 20))
                
                Toggle("Show Dua of the Day in Home Screen", isOn: $DuaModel.showDhuainHome)
                    .font(Font.custom("Avenir Light", size: 17))
                Divider()
                
                // MARK: Location Settings
                HStack{
                    Text("Locations: ")
                        .font(Font.custom("Avenir Light", size: 17))
                    
                    Picker("Locations", selection: $IslandModel.locationIndex) {
                        ForEach(0..<IslandModel.Islands.count) { islandIndex in
                            
                            var atollObj = AtollsViewModel.getAtoll(atollCode: IslandModel.Islands[islandIndex].atoll_code)
                            
                            
                            Text("\(atollObj.name_abbr_en). \(IslandModel.Islands[islandIndex].name_en)")
                                .tag(islandIndex)
                                .font(Font.custom("Avenir Light", size: 17))
                        }
                    }.pickerStyle(MenuPickerStyle())
    
                }
            }.padding()
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(DuasViewModel())
            .environmentObject(IslandsViewMode())
            .environmentObject(AtollsViewModel())
    }
}
