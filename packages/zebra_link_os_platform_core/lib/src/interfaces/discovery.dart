import 'package:zebra_link_os_platform_core/classes.dart';

/// Interface used for classes which need implement printer discovery.
abstract interface class ZebraDiscoveryInterface {
  /// Stream of discovered printers.
  ///
  /// Whenever a printer is discovered it is added to this stream.
  Stream<DiscoveredPrinter> get printerFound;

  /// Start discovering printers.
  ///
  /// When a printer is found it will be added to the [printerFound] stream.
  Future<List<DiscoveredPrinter>?> startDiscovery();
}
