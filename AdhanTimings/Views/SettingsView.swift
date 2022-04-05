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
    @EnvironmentObject var PrayerTimesModel:PrayerTimesViewModel
    
    var body: some View {
        
        ZStack {
            Image("Background")
                .resizable()
                .ignoresSafeArea()
            VStack(alignment: .leading){
                // MARK: Show Dua of the Day Home Screen
                Text("Settings")
                    .font(Font.custom("Optima Bold", size: 30))
                
                Toggle("Show Dua Card in Home Screen", isOn: $DuaModel.showDhuainHome)
                    .font(Font.custom("Optima Regular", size: 20))
                Divider()
                
                // MARK: Location Settings
                HStack{
                    Text("Location: ")
                        .font(Font.custom("Optima Regular", size: 20))
                    
                    Picker("Location", selection: $IslandModel.locationIndex) {
                        ForEach(0..<IslandModel.Islands.count) { islandIndex in
                            
                            var atollObj = AtollsViewModel.getAtoll(atollCode: IslandModel.Islands[islandIndex].atoll_code)
                            
                            
                            Text("\(atollObj.name_abbr_en). \(IslandModel.Islands[islandIndex].name_en)")
                                .tag(islandIndex)
                                .font(Font.custom("Optima Regular", size: 20))
                        }
                    }.pickerStyle(MenuPickerStyle())
                        .onChange(of: IslandModel.locationIndex) { newLocation in
                            PrayerTimesModel.updateTodaysPrayerTimes(locationIndex: newLocation)
                        }

                }
                Spacer()
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
            .environmentObject(PrayerTimesViewModel())
    }
}
