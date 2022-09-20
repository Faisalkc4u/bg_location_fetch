import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'bg_location_fetch_method_channel.dart';

abstract class BgLocationFetchPlatform extends PlatformInterface {
  /// Constructs a BgLocationFetchPlatform.
  BgLocationFetchPlatform() : super(token: _token);

  static final Object _token = Object();

  static BgLocationFetchPlatform _instance = MethodChannelBgLocationFetch();

  /// The default instance of [BgLocationFetchPlatform] to use.
  ///
  /// Defaults to [MethodChannelBgLocationFetch].
  static BgLocationFetchPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [BgLocationFetchPlatform] when
  /// they register themselves.
  static set instance(BgLocationFetchPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<void> token(Map<String, dynamic> keys) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
