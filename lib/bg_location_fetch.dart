import 'bg_location_fetch_platform_interface.dart';

class BgLocationFetch {
  Future<String?> getPlatformVersion() {
    return BgLocationFetchPlatform.instance.getPlatformVersion();
  }

  Future<void> setValues(Map<String, dynamic> keys) {
    return BgLocationFetchPlatform.instance.token(keys);
  }

  Future<void> requestForPermission() {
    return BgLocationFetchPlatform.instance.requestForPermission();
  }

  Future<void> initService() {
    return BgLocationFetchPlatform.instance.initService();
  }
}
