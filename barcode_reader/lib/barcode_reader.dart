import 'dart:async';

import 'package:flutter/services.dart';

class BarcodeReader {
  static const MethodChannel _channel =
      const MethodChannel('barcode_reader');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  Future<void> initLicense(String license) async {
    await _channel.invokeMethod('initLicense', [license]);
  }

  Future<String> decodeFile(String filename) async {
    return await _channel.invokeMethod('decodeFile', [filename]);
  }
}
