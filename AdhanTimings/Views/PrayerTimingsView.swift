//
//  PrayerTimingsView.swift
//  AdhanTimings
//
//  Created by Ahmed Iyad on 2-4-22.
//

import SwiftUI

struct PrayerTimingsView: View {
    @EnvironmentObject var DuaModel:DuasViewModel
    
    var body: some View {
        ScrollView{
            // MARK: HEADER - Home Screen
            HStack{
                VStack(alignment: .leading){
                    Text("Next Prayer")
                        .font(Font.custom("Avenir Heavy", size: 20))
                    Text("15:15")
                        .font(Font.custom("Avenir Black", size: 40))
                    Text("This many hours left till Asr")
                        .font(Font.custom("Avenir Light", size: 17))
                        .foregroundColor(.gray)
                    
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
            VStack(spacing: 50){
                HStack{
                    Image(systemName: "sun.and.horizon.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: max(24, 48))
                    Text("Fajr")
                        .font(Font.custom("Gotu", size: 30))
                    Spacer()
                    Text("4:13")
                        .font(Font.custom("Gotu", size: 30))
                }
                
                HStack{
                    Image(systemName: "sunrise.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: max(24, 48))
                    Text("Sunrise")
                        .font(Font.custom("Gotu Regular", size: 30))
                    Spacer()
                    Text("6:17")
                        .font(Font.custom("Gotu Regular", size: 30))
                }
                
                HStack{
                    Image(systemName: "sun.max.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: max(24, 48))
                    Text("Dhuhr")
                        .font(Font.custom("Gotu Regular", size: 30))
                    Spacer()
                    Text("13:00")
                        .font(Font.custom("Gotu Regular", size: 30))
                }
                
                HStack{
                    Image(systemName: "cloud.sun.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: max(24, 48))
                    Text("Ashar")
                        .font(Font.custom("Gotu Regular", size: 30))
                    Spacer()
                    Text("16:15")
                        .font(Font.custom("Gotu Regular", size: 30))
                }
                
                HStack{
                    Image(systemName: "sun.haze.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: max(24, 48))
                    Text("Maghrib")
                        .font(Font.custom("Gotu Regular", size: 30))
                    Spacer()
                    Text("16:15")
                        .font(Font.custom("Gotu Regular", size: 30))
                }
                
                HStack{
                    Image(systemName: "moon.stars.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: max(24, 48))
                    Text("Isha")
                        .font(Font.custom("Gotu Regular", size: 30))
                    Spacer()
                    Text("21:36")
                        .font(Font.custom("Gotu Regular", size: 30))
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
}

struct PrayerTimingsView_Previews: PreviewProvider {
    static var previews: some View {
        PrayerTimingsView()
            .environmentObject(DuasViewModel())
    }
}
