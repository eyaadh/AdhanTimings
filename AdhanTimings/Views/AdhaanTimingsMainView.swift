//
//  ContentView.swift
//  AdhanTimings
//
//  Created by Ahmed Iyad on 2-4-22.
//

import SwiftUI

struct AdhaanTimingsMainView: View {
    @EnvironmentObject var DuaModel:DuasViewModel
    @EnvironmentObject var IslandModel:IslandsViewMode
    
    var body: some View {
        TabView {
            PrayerTimingsView()
            .tabItem {
                VStack{
                    Image(systemName: "alarm")
                    Text("Prayer Timings")
                }
            }
            
            DhuasView()
            .tabItem {
                VStack{
                    Image(systemName: "list.bullet.rectangle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(height: max(24,48))
                    Text("Duas")
                }
            }
            
            SettingsView()
            .tabItem {
                VStack{
                    Image(systemName: "gear.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(height: max(24,48))
                    Text("Settings")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AdhaanTimingsMainView()
            .environmentObject(DuasViewModel())
            .environmentObject(IslandsViewMode())
    }
}
