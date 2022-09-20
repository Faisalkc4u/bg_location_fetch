import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:bg_location_fetch/bg_location_fetch.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  final _bgLocationFetchPlugin = BgLocationFetch();

  @override
  void initState() {
    super.initState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion = await _bgLocationFetchPlugin.getPlatformVersion() ??
          'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: [
              MaterialButton(
                onPressed: () {
                  _bgLocationFetchPlugin.requestForPermission();
                },
                child: const Text("Permission"),
              ),
              MaterialButton(
                onPressed: () {
                  _bgLocationFetchPlugin.setValues({
                    "auth_token": "123123",
                    "upload_url":
                        "https://faisalkc4u.requestcatcher.com/location_updates"
                  });
                },
                child: const Text("Init Call"),
              ),
              MaterialButton(
                onPressed: () {
                  _bgLocationFetchPlugin.initService();
                },
                child: const Text("Init Service Call"),
              ),
              Text('Running on: $_platformVersion\n'),
            ],
          ),
        ),
      ),
    );
  }
}
