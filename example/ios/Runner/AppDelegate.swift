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
        let remoteNotif = launchOptions?[UIApplication.LaunchOptionsKey.location] as? [String: Any]
           if remoteNotif != nil {
    SwiftBgLocationFetchPlugin.initCall()
           }
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
   
}
