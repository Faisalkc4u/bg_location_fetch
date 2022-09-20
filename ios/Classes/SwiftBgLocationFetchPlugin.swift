import Flutter
import UIKit
import CoreLocation

public class SwiftBgLocationFetchPlugin: NSObject, FlutterPlugin {

    static let shared = SwiftBgLocationFetchPlugin ()

  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "bg_location_fetch", binaryMessenger: registrar.messenger())
    registrar.addMethodCallDelegate(SwiftBgLocationFetchPlugin.shared, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
        case "token":
        DataStorage.handleArgs(parms: call.arguments as? Dictionary<String, Any>)
        case "request_permission":
        LocationManager.shared.requestLocationAuthorization()
        case "start_service":
        LocationManager.shared.startMySignificantLocationChanges()
     default:
      LocationManager.shared.requestLocationAuthorization()
      result("iOS " + UIDevice.current.systemVersion)
    }
  }
  public static func initCall(){
    LocationManager.shared.requestLocationAuthorization()
    LocationManager.shared.startMySignificantLocationChanges()
  }
 
 
}
