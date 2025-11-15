import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'floating_panel_platform_interface.dart';

/// An implementation of [FloatingPanelPlatform] that uses method channels.
class MethodChannelFloatingPanel extends FloatingPanelPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('macos_floating_panel');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<bool> show({double? width, double? height, double? x, double? y}) async {
    final Map<String, dynamic> arguments = {};
    if (width != null) arguments['width'] = width;
    if (height != null) arguments['height'] = height;
    if (x != null) arguments['x'] = x;
    if (y != null) arguments['y'] = y;

    final result = await methodChannel.invokeMethod<bool>('show', arguments);
    return result ?? false;
  }

  @override
  Future<bool> hide() async {
    final result = await methodChannel.invokeMethod<bool>('hide');
    return result ?? false;
  }

  @override
  Future<bool> isVisible() async {
    final result = await methodChannel.invokeMethod<bool>('isVisible');
    return result ?? false;
  }

  @override
  Future<bool> setSize(double width, double height) async {
    final result = await methodChannel.invokeMethod<bool>('setSize', {
      'width': width,
      'height': height,
    });
    return result ?? false;
  }

  @override
  Future<bool> setPosition(double x, double y) async {
    final result = await methodChannel.invokeMethod<bool>('setPosition', {
      'x': x,
      'y': y,
    });
    return result ?? false;
  }
}
