import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'bg_location_fetch_platform_interface.dart';

/// An implementation of [BgLocationFetchPlatform] that uses method channels.
class MethodChannelBgLocationFetch extends BgLocationFetchPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('bg_location_fetch');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<void> token(Map<String, dynamic> keys) async {
    await methodChannel.invokeMethod<void>('token', keys);
    return;
  }

  @override
  Future<void> initService() async {
    await methodChannel.invokeMethod<void>('start_service');
  }

  @override
  Future<void> requestForPermission() async {
    await methodChannel.invokeMethod<void>('request_permission');
  }
}
