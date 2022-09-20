import UIKit
import Flutter

import bg_location_fetch
@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    // Add bg_location_fetch this line
              SwiftBgLocationFetchPlugin.initCall()
    // END bg_location_fetch this line
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
   
}
