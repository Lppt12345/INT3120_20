
import 'dart:async';

import 'package:flutter/services.dart';

class SamplePluginFlutter {
  static const MethodChannel _channel = MethodChannel('sample_plugin_flutter');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
