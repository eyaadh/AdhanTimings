//
//  PrayerTimingsView.swift
//  AdhanTimings
//
//  Created by Ahmed Iyad on 2-4-22.
//

import SwiftUI

struct PrayerTimingsView: View {
    @EnvironmentObject var DuaModel:DuasViewModel
    @EnvironmentObject var IslandModel:IslandsViewMode
    @EnvironmentObject var PrayerTimesModel:PrayerTimesViewModel
    
    @State var todaysDate = ""
    
    
    var body: some View {
        ZStack {
            Image("Background")
                .resizable()
                .ignoresSafeArea()
            VStack{
                ScrollView{
                    // MARK: HEADER - Home Screen
                    HStack{
                        VStack(alignment: .leading){
                            Text("Adhan Timings")
                                .font(Font.custom("Optima Bold", size: 20))
                            Text(PrayerTimesModel.selectedIslandName)
                                .font(Font.custom("Optima Bold", size: 30))
                            Text(todaysDate)
                                .font(Font.custom("Optima Regular", size: 20))
                            
                        }
                        .padding()
                        Spacer()
                        Image("mosque")
                            .resizable()
                            .scaledToFit()
                            .frame(width:128)
                            .padding(.trailing)
                    }
                    Divider()
                    
                    // MARK: Body - Home Screen
                    VStack(spacing: DuaModel.showDhuainHome ? 30 : 60){
                        HStack{
                            Image(systemName: "sun.and.horizon.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: max(24, 48))
                            Text("Fajr")
                                .font(Font.custom("Optima Bold", size: 30))
                            Spacer()
                            Text(PrayerTimesModel.TodaysPrayerTimes.fajr)
                                .font(Font.custom("Optima Bold", size: 30))
                        }
                        
                        HStack{
                            Image(systemName: "sunrise.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: max(24, 48))
                            Text("Sunrise")
                                .font(Font.custom("Optima Bold", size: 30))
                            Spacer()
                            Text(PrayerTimesModel.TodaysPrayerTimes.sunrise)
                                .font(Font.custom("Optima Bold", size: 30))
                        }
                        
                        HStack{
                            Image(systemName: "sun.max.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: max(24, 48))
                            Text("Dhuhr")
                                .font(Font.custom("Optima Bold", size: 30))
                            Spacer()
                            Text(PrayerTimesModel.TodaysPrayerTimes.duhr)
                                .font(Font.custom("Optima Bold", size: 30))
                        }
                        
                        HStack{
                            Image(systemName: "cloud.sun.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: max(24, 48))
                            Text("Ashar")
                                .font(Font.custom("Optima Bold", size: 30))
                            Spacer()
                            Text(PrayerTimesModel.TodaysPrayerTimes.asr)
                                .font(Font.custom("Optima Bold", size: 30))
                        }
                        
                        HStack{
                            Image(systemName: "sun.haze.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: max(24, 48))
                            Text("Maghrib")
                                .font(Font.custom("Optima Bold", size: 30))
                            Spacer()
                            Text(PrayerTimesModel.TodaysPrayerTimes.maghrib)
                                .font(Font.custom("Optima Bold", size: 30))
                        }
                        
                        HStack{
                            Image(systemName: "moon.stars.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: max(24, 48))
                            Text("Isha")
                                .font(Font.custom("Optima Bold", size: 30))
                            Spacer()
                            Text(PrayerTimesModel.TodaysPrayerTimes.isha)
                                .font(Font.custom("Optima Bold", size: 30))
                        }
                    }
                    .padding()
                    .foregroundColor(Color.gray)
                    
                    if DuaModel.showDhuainHome {
                        Divider()
                        DuaoftheDayView()
                    }
                }
                
            }
            .onAppear{
                todaysDate = String(DateFormatter.localizedString(from: Date(), dateStyle: .long, timeStyle: .none))
                // MARK: TODO
                // PrayerTimesModel.updateTodaysPrayerTimes()
            }
        }
        .onChange(of: IslandModel.locationIndex, perform: { newValue in
            PrayerTimesModel.updateTodaysPrayerTimes(locationIndex: newValue)
        })
    }
        
}

struct PrayerTimingsView_Previews: PreviewProvider {
    static var previews: some View {
        PrayerTimingsView()
            .environmentObject(DuasViewModel())
            .environmentObject(IslandsViewMode())
            .environmentObject(PrayerTimesViewModel())
    }
}
