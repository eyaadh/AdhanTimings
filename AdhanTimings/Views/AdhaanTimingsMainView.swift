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
    @EnvironmentObject var AtollModel:AtollsViewModel
    
    var body: some View {
        TabView {
            PrayerTimingsView()
            .tabItem {
                VStack{
                    Image(systemName: "alarm")
                    Text("Prayer Timings")
                        .foregroundColor(Color.primary)
                }
            }
            
            DhuasListView()
            .tabItem {
                VStack{
                    Image(systemName: "list.bullet.rectangle.fill")
                    Text("Duas")
                        .foregroundColor(Color.primary)
                }
            }
            
            SettingsView()
            .tabItem {
                VStack{
                    Image(systemName: "gear.circle")
                    Text("Settings")
                        .foregroundColor(Color.primary)
                }
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AdhaanTimingsMainView()
            .environmentObject(DuasViewModel())
            .environmentObject(IslandsViewMode())
            .environmentObject(AtollsViewModel())
            .environmentObject(PrayerTimesViewModel())
    }
}
