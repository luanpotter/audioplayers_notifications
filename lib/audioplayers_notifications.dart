import 'dart:async';

import 'package:flutter/services.dart';

class AudioplayersNotifications {
  static const MethodChannel _channel =
      const MethodChannel('audioplayers_notifications');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
