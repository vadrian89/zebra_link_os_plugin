/// Class representing a discovered printer.
sealed class DiscoveredPrinter {
  // The MAC address, IP Address, or local name of printer.
  final String address;

  const DiscoveredPrinter({required this.address});

  /// Creates a new instance of [DiscoveredPrinterBluetooth].
  const factory DiscoveredPrinter.bluetooth({
    required String address,
    required String friendlyName,
  }) = DiscoveredPrinterBluetooth;

  @override
  String toString() => "DiscoveredPrinter(address: $address)";
}

/// A discovered printer over Bluetooth.
///
/// Currently only classic Bluetooth is supported.
class DiscoveredPrinterBluetooth extends DiscoveredPrinter {
  /// The friendly name of the Bluetooth device.
  final String friendlyName;

  const DiscoveredPrinterBluetooth({required super.address, required this.friendlyName});

  @override
  String toString() => "DiscoveredPrinterBluetooth(address: $address, friendlyName: $friendlyName)";
}
