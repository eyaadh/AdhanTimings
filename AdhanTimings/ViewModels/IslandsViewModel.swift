//
//  IslandsViewModel.swift
//  AdhanTimings
//
//  Created by Ahmed Iyad on 2-4-22.
//

import Foundation
import CoreLocation

class IslandsViewMode: NSObject, CLLocationManagerDelegate, ObservableObject {
    @Published var Islands = [Island]()
    @Published var locationIndex:Int = 193  // 193 K.Male in default
    @Published var currentUsersLocation:CLLocation = CLLocation()
    @Published var autoLocationUpdate:Bool = true
    
    var locationManager = CLLocationManager()
    
    override init () {
        super.init()
        
        locationManager.delegate = self
        
        locationManager.requestWhenInUseAuthorization()
        
        // load islands Data from JSON
        self.Islands = IslandsDataService.getData()
    }
    
    // MARK: - Get users location with location Manager delegate methods
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if locationManager.authorizationStatus == .authorizedAlways || locationManager.authorizationStatus == .authorizedWhenInUse {
            locationManager.startUpdatingLocation()
        } else if locationManager.authorizationStatus == .denied {
            // we do not have permission
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        checkClosestLocation(userLocation: locations.first!)
        
        if !autoLocationUpdate {
            locationManager.stopUpdatingLocation()
        } else {
            locationManager.startUpdatingLocation()
        }
        
    }
    
    func checkClosestLocation(userLocation: CLLocation){
        // create the locations of the islands within an array
        var locationsArray:[CLLocation] = [CLLocation]()
            
        for island in Islands{
            locationsArray.append(CLLocation(latitude: Double(island.lat)!, longitude: Double(island.lng)!))
        }
        
        let closest = locationsArray.min(by:{ $0.distance(from: userLocation) < $1.distance(from: userLocation) })
        
        if let closestLocation = closest {
            for islandIndex in 0..<Islands.count{
                if Islands[islandIndex].lng == String(closestLocation.coordinate.longitude) &&
                    Islands[islandIndex].lat == String(closestLocation.coordinate.latitude) {
                 
                    self.locationIndex = islandIndex
                }
            }
        }
    }
    
}
