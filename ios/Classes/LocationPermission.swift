//
//  LocationPermission.swift
//  bglocation
//
//  Created by user on 15/09/2022.
//

import CoreLocation
import UIKit

class LocationManager: NSObject, CLLocationManagerDelegate {
    
    static let shared = LocationManager()
    override init() {
        super.init()
        self.locationManager.delegate = self
    }
    private var locationManager: CLLocationManager = CLLocationManager()
    private var requestLocationAuthorizationCallback: ((CLAuthorizationStatus) -> Void)?
    
    
    func startMySignificantLocationChanges() {
        if !CLLocationManager.significantLocationChangeMonitoringAvailable() {
            return
        }
        
        locationManager.showsBackgroundLocationIndicator=true
        locationManager.distanceFilter = 0
        locationManager.pausesLocationUpdatesAutomatically = false
        locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        locationManager.activityType = .automotiveNavigation
        locationManager.allowsBackgroundLocationUpdates = true
        locationManager.startMonitoringSignificantLocationChanges()
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        DataCenter().sendLocations(locValue.latitude.description, locValue.longitude.description , bgMode: UIApplication.shared.applicationState == .background )
        
    }
    public func requestLocationAuthorization() {
       
        var currentStatus:CLAuthorizationStatus?
        if #available(iOS 14, *) {
            currentStatus = CLLocationManager().authorizationStatus
        } else {
            currentStatus = CLLocationManager.authorizationStatus()
        }
        // Only ask authorization if it was never asked before
        guard currentStatus == .notDetermined else {
            
            return }
        
        // Starting on iOS 13.4.0, to get .authorizedAlways permission, you need to
        // first ask for WhenInUse permission, then ask for Always permission to
        // get to a second system alert
        if #available(iOS 13.4, *) {
            self.requestLocationAuthorizationCallback = { status in
                if status == .authorizedWhenInUse {
                    self.locationManager.requestAlwaysAuthorization()
                }
            }
            self.locationManager.requestWhenInUseAuthorization()
        } else {
            self.locationManager.requestAlwaysAuthorization()
        }
    }
    // MARK: - CLLocationManagerDelegate
    public func locationManager(_ manager: CLLocationManager,
                                didChangeAuthorization status: CLAuthorizationStatus) {
        self.requestLocationAuthorizationCallback?(status)
        
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        if let error = error as? CLError, error.code == .denied {
            
            manager.stopMonitoringSignificantLocationChanges()
            return
        }
    }
}
