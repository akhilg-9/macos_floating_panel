import 'package:flutter_test/flutter_test.dart';
import 'package:macos_floating_panel/floating_panel.dart';
import 'package:macos_floating_panel/floating_panel_platform_interface.dart';
import 'package:macos_floating_panel/floating_panel_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFloatingPanelPlatform
    with MockPlatformInterfaceMixin
    implements FloatingPanelPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<bool> show({double? width, double? height, double? x, double? y}) =>
      Future.value(true);

  @override
  Future<bool> hide() => Future.value(true);

  @override
  Future<bool> isVisible() => Future.value(true);

  @override
  Future<bool> setSize(double width, double height) => Future.value(true);

  @override
  Future<bool> setPosition(double x, double y) => Future.value(true);
}

void main() {
  final FloatingPanelPlatform initialPlatform = FloatingPanelPlatform.instance;

  test('$MethodChannelFloatingPanel is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFloatingPanel>());
  });

  test('show returns true', () async {
    MockFloatingPanelPlatform fakePlatform = MockFloatingPanelPlatform();
    FloatingPanelPlatform.instance = fakePlatform;

    expect(await FloatingPanel.instance.show(), true);
  });

  test('hide returns true', () async {
    MockFloatingPanelPlatform fakePlatform = MockFloatingPanelPlatform();
    FloatingPanelPlatform.instance = fakePlatform;

    expect(await FloatingPanel.instance.hide(), true);
  });

  test('isVisible returns true', () async {
    MockFloatingPanelPlatform fakePlatform = MockFloatingPanelPlatform();
    FloatingPanelPlatform.instance = fakePlatform;

    expect(await FloatingPanel.instance.isVisible(), true);
  });
}
