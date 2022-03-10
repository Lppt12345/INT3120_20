import 'dart:async';

import 'package:flutter/services.dart';

class MyBrowser {
  static const MethodChannel _channel = MethodChannel('open_browser');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  Future<void> openBrowser(url) async {
    try {
      final int result = await _channel
          .invokeMethod('openBrowser', <String, String>{'url': url});
    } on PlatformException catch (e) {
      print(e);
    }
  }
}
