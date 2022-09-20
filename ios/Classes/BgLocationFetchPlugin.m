#import "BgLocationFetchPlugin.h"
#if __has_include(<bg_location_fetch/bg_location_fetch-Swift.h>)
#import <bg_location_fetch/bg_location_fetch-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "bg_location_fetch-Swift.h"
#endif

@implementation BgLocationFetchPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftBgLocationFetchPlugin registerWithRegistrar:registrar];
}
@end
