# bg_location_fetch

This plugging is developer for only ios
## Getting Started

```
bg_location_fetch:
    git:
      url: https://github.com/Faisalkc4u/bg_location_fetch.git
```

## iOS
- update ```AppDelegate.swift``` file

```
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
        let remoteLocation = launchOptions?[UIApplication.LaunchOptionsKey.location] as? [String: Any]
           if remoteLocation != nil {
              SwiftBgLocationFetchPlugin.initCall()
           }
    // END bg_location_fetch this line
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
   
}

 ``` 


 ## Usage

 - Initialization

 ```
   final _bgLocationFetchPlugin = BgLocationFetch();
    await _bgLocationFetchPlugin.setValues({
                    "auth_token": "123123",
                    "upload_url":
                        "https://xyz.requestcatcher.com/location_updates"
                  });
 ```

 - Permission request for location

 ```
  await _bgLocationFetchPlugin.requestForPermission()
 ```
 - Start accessing location

 ```
  await _bgLocationFetchPlugin.initService()
 ```