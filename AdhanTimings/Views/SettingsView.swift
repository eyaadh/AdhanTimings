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
    
    @State var lastNotificationUpdatedDate:DateComponents = DateComponents()
    @State var pendingNotifications:[String] = [String]()
    
    
    var body: some View {
        
        ZStack {
            Image("Background")
                .resizable()
                .ignoresSafeArea()
            VStack(alignment: .leading){
                // MARK: - Show Dua of the Day Home Screen
                Text("Settings")
                    .font(Font.custom("Optima Bold", size: 30))
                
                Toggle("Show Dua Card in Home Screen", isOn: $DuaModel.showDhuainHome)
                    .font(Font.custom("Optima Regular", size: 20))
                Divider()
                
                // MARK: - Location Settings
                Toggle("Update my Location Automatically", isOn: $IslandModel.autoLocationUpdate)
                    .font(Font.custom("Optima Regular", size: 20))
                    .onChange(of: IslandModel.autoLocationUpdate) { _ in
                        if IslandModel.autoLocationUpdate {
                            IslandModel.locationManager.startUpdatingLocation()
                        } else {
                            IslandModel.locationManager.stopUpdatingLocation()
                        }
                    }
                
                HStack{
                    Text("Selected Location: ")
                        .font(Font.custom("Optima Regular", size: 20))
                    
                    Picker("Location", selection: $IslandModel.locationIndex) {
                        ForEach(0..<IslandModel.Islands.count) { islandIndex in
                            
                            let atollObj = AtollsViewModel.getAtoll(atollCode: IslandModel.Islands[islandIndex].atoll_code)
                            
                            
                            Text("\(atollObj.name_abbr_en). \(IslandModel.Islands[islandIndex].name_en)")
                                .tag(islandIndex)
                                .font(Font.custom("Optima Regular", size: 20))
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    .disabled(IslandModel.autoLocationUpdate)
                    .onChange(of: IslandModel.locationIndex) { newLocation in
                        PrayerTimesModel.updateTodaysPrayerTimes(locationIndex: newLocation)
                    }

                }
                Divider()
                
                // MARK: - Location Settings
                Toggle("Enable Prayer Notifications", isOn: $PrayerTimesModel.statusPrayerNotifications)
                    .font(Font.custom("Optima Regular", size: 20))
                    .onChange(of: PrayerTimesModel.statusPrayerNotifications) { state in
                        if state {
                            addNotifications()
                        }
                        else {
                            removePendingNotifications()
                        }
                    }
                Spacer()
            }.padding()
        }
    }
    
    func addNotifications(){
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            let currentDate:DateComponents = Calendar.current.dateComponents([.year, .month, .day], from: Date())
            
            if currentDate != lastNotificationUpdatedDate {
                lastNotificationUpdatedDate = currentDate
                
                if success {
                    // add notifications for today
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "HH:mm"
                    let fajrDateComponents = dateFormatter.date(from: PrayerTimesModel.TodaysPrayerTimes.fajr)
                    
                    createNotification(
                        title: "Fajr Prayer Time",
                        subtitle: "\(String(describing: dateFormatter.date(from: PrayerTimesModel.TodaysPrayerTimes.fajr))) Fajr Prayer Time for \(PrayerTimesModel.selectedIslandName)",
                        date: fajrDateComponents!)
                    
                    let duhurDateComponents = dateFormatter.date(from: PrayerTimesModel.TodaysPrayerTimes.duhr)
                    createNotification(
                        title: "Duhr Prayer Time",
                        subtitle: "\(PrayerTimesModel.TodaysPrayerTimes.duhr) Duhr Prayer Time for \(PrayerTimesModel.selectedIslandName)",
                        date: duhurDateComponents!)
                    
                    let asrDateComponents = dateFormatter.date(from: PrayerTimesModel.TodaysPrayerTimes.asr)
                    
                    createNotification(
                        title: "Asr Prayer Time",
                        subtitle: "\(PrayerTimesModel.TodaysPrayerTimes.asr) Asr Prayer Time for \(PrayerTimesModel.selectedIslandName)",
                        date: asrDateComponents!)
                    
                    let maghribDateComponents = dateFormatter.date(from: PrayerTimesModel.TodaysPrayerTimes.maghrib)
                    
                    createNotification(
                        title: "Maghrib Prayer Time",
                        subtitle: "\(PrayerTimesModel.TodaysPrayerTimes.maghrib) Maghrib Prayer Time for \(PrayerTimesModel.selectedIslandName)",
                        date: maghribDateComponents!)
                    
                    let ishaDateComponents = dateFormatter.date(from: PrayerTimesModel.TodaysPrayerTimes.isha)
                    
                    createNotification(
                        title: "Isha Prayer Time",
                        subtitle: "\(PrayerTimesModel.TodaysPrayerTimes.isha)) Isha Prayer Time for \(PrayerTimesModel.selectedIslandName)",
                        date: ishaDateComponents!)
                    
//                    let test = dateFormatter.date(from: "16:49")
//                    
//                    createNotification(
//                        title: "Isha Prayer Time",
//                        subtitle: "\(PrayerTimesModel.TodaysPrayerTimes.isha) Isha Prayer Time for \(PrayerTimesModel.selectedIslandName)",
//                        date: test!)
                    
                } else if let error = error {
                    print(error)
                }
            }
            
            
        }
    }
    
    func createNotification(title:String, subtitle:String, date:Date){
        let content = UNMutableNotificationContent()
        content.title = title
        content.subtitle = subtitle
        
        content.sound = UNNotificationSound.default
        
        var triggerDate = DateComponents()
        triggerDate.hour = Calendar.current.component(.hour, from: date)
        triggerDate.minute = Calendar.current.component(.minute, from: date)

        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: false)
        
        let uniqueIdentifier = UUID().uuidString

        // choose a random identifier
        let request = UNNotificationRequest(identifier: uniqueIdentifier, content: content, trigger: trigger)
        
        pendingNotifications.append(uniqueIdentifier)
        
        // add our notification request
        UNUserNotificationCenter.current().add(request)
    }
    
    func removePendingNotifications(){
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: pendingNotifications)
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
