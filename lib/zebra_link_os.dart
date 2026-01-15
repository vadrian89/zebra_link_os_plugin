import 'package:zebra_link_os_platform_core/classes.dart';
import 'package:zebra_link_os_platform_core/interfaces.dart';
import 'package:zebra_link_os_platform_core/zebra_link_os_plugin.dart';

export 'core.dart';

class ZebraLinkOs implements ZebraLinkOsPluginInterface {
  static ZebraLinkOs? _instance;

  ZebraLinkOsPluginBase get _pluginInstance => ZebraLinkOsPluginBase.instance;

  const ZebraLinkOs._();

  /// Retrieve the instance of [ZebraLinkOs]
  factory ZebraLinkOs() => _instance ??= const ZebraLinkOs._();

  @override
  Stream<DiscoveredPrinter> get printerFound => _pluginInstance.printerFound;

  @override
  Future<List<DiscoveredPrinter>?> startDiscovery() => _pluginInstance.startDiscovery();

  @override
  Future<void> dispose() => _pluginInstance.dispose();

  @override
  Future<bool> connect({required String address}) => _pluginInstance.connect(address: address);

  @override
  Future<bool> disconnect() => _pluginInstance.disconnect();

  @override
  Future<bool> write({required String data}) => _pluginInstance.write(data: data);

  @override
  Future<bool> printImageFile({
    required String filePath,
    int width = 0,
    int height = 0,
    int x = 0,
    int y = 0,
    bool insideFormat = false,
  }) =>
      _pluginInstance.printImageFile(
        filePath: filePath,
        width: width,
        height: height,
        x: x,
        y: y,
        insideFormat: insideFormat,
      );

  @override
  Future<bool> storeImage({
    required String filePath,
    required String deviceDriveAndFileName,
    int width = 0,
    int height = 0,
  }) =>
      _pluginInstance.storeImage(
        filePath: filePath,
        deviceDriveAndFileName: deviceDriveAndFileName,
        width: width,
        height: height,
      );
}
