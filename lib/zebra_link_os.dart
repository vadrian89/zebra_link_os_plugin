import 'package:zebra_link_os_platform_core/classes.dart';
import 'package:zebra_link_os_platform_core/interfaces.dart';
import 'package:zebra_link_os_platform_core/zebra_link_os_plugin.dart';

export 'core.dart';

class ZebraLinkOs implements ZebraLinkOsPluginInterface {
  ZebraLinkOsPluginBase get _instance => ZebraLinkOsPluginBase.instance;

  ZebraLinkOsPluginBase get pluginInstance => _instance;

  ZebraLinkOs();

  @override
  Stream<DiscoveredPrinter> get printerFound => _instance.printerFound;

  @override
  Future<List<DiscoveredPrinter>?> startDiscovery() => _instance.startDiscovery();

  @override
  Future<void> dispose() => _instance.dispose();

  @override
  Future<bool> connect({required String address}) => _instance.connect(address: address);

  @override
  Future<bool> disconnect() => _instance.disconnect();

  @override
  Future<bool> write({required String data}) => _instance.write(data: data);

  @override
  Future<bool> printImageFile({
    required String filePath,
    int width = 0,
    int height = 0,
    int x = 0,
    int y = 0,
    bool insideFormat = false,
  }) =>
      _instance.printImageFile(
        filePath: filePath,
        width: width,
        height: height,
        x: x,
        y: y,
        insideFormat: insideFormat,
      );
}
