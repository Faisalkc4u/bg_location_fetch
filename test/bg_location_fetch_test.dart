import 'package:flutter_test/flutter_test.dart';
import 'package:bg_location_fetch/bg_location_fetch.dart';
import 'package:bg_location_fetch/bg_location_fetch_platform_interface.dart';
import 'package:bg_location_fetch/bg_location_fetch_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockBgLocationFetchPlatform 
    with MockPlatformInterfaceMixin
    implements BgLocationFetchPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final BgLocationFetchPlatform initialPlatform = BgLocationFetchPlatform.instance;

  test('$MethodChannelBgLocationFetch is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelBgLocationFetch>());
  });

  test('getPlatformVersion', () async {
    BgLocationFetch bgLocationFetchPlugin = BgLocationFetch();
    MockBgLocationFetchPlatform fakePlatform = MockBgLocationFetchPlatform();
    BgLocationFetchPlatform.instance = fakePlatform;
  
    expect(await bgLocationFetchPlugin.getPlatformVersion(), '42');
  });
}
