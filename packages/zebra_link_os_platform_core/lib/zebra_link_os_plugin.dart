library zebra_link_os_platform_base;

import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'classes.dart';
import 'interfaces.dart';

/// Base class for the Zebra Link-OS plugin.
abstract class ZebraLinkOsPluginBase extends PlatformInterface
    implements ZebraLinkOsPluginInterface {
  ZebraLinkOsPluginBase() : super(token: _token);

  static final Object _token = Object();

  static ZebraLinkOsPluginBase? _instance;

  static ZebraLinkOsPluginBase get instance => _instance ??= ZebraLinkOsDefault();

  static set instance(ZebraLinkOsPluginBase instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  @override
  Future<bool> connect({required String address});

  @override
  Future<bool> disconnect();

  @override
  Future<bool> write({required String data});

  @override
  Future<bool> printImageFile({
    required String filePath,
    int width = 0,
    int height = 0,
    int x = 0,
    int y = 0,
    bool insideFormat = false,
  });

  @override
  Future<bool> storeImage({
    required String filePath,
    required String deviceDriveAndFileName,
    int width = 0,
    int height = 0,
  });
}

/// Default implementation of the ZebraLinkOsPlatform.
class ZebraLinkOsDefault extends ZebraLinkOsPluginBase {
  @override
  Future<void> dispose() => throw UnimplementedError();

  @override
  Stream<DiscoveredPrinter> get printerFound => throw UnimplementedError();

  @override
  Future<bool> write({required String data}) => throw UnimplementedError();

  @override
  Future<bool> printImageFile({
    required String filePath,
    int width = 0,
    int height = 0,
    int x = 0,
    int y = 0,
    bool insideFormat = false,
  }) =>
      throw UnimplementedError();

  @override
  Future<bool> storeImage({
    required String filePath,
    required String deviceDriveAndFileName,
    int width = 0,
    int height = 0,
  }) =>
      throw UnimplementedError();

  @override
  Future<bool> connect({required String address}) => throw UnimplementedError();

  @override
  Future<bool> disconnect() => throw UnimplementedError();

  @override
  Future<List<DiscoveredPrinter>?> startDiscovery() => throw UnimplementedError();
}
