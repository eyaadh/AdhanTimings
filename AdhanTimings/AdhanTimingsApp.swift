//
//  AdhanTimingsApp.swift
//  AdhanTimings
//
//  Created by Ahmed Iyad on 2-4-22.
//

import SwiftUI

@main
struct AdhanTimingsApp: App {
    var body: some Scene {
        WindowGroup {
            AdhaanTimingsMainView()
                .environmentObject(DuasViewModel())
                .environmentObject(IslandsViewMode())
                .environmentObject(AtollsViewModel())
        }
    }
}
