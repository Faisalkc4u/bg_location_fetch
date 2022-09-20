import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bg_location_fetch/bg_location_fetch_method_channel.dart';

void main() {
  MethodChannelBgLocationFetch platform = MethodChannelBgLocationFetch();
  const MethodChannel channel = MethodChannel('bg_location_fetch');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
