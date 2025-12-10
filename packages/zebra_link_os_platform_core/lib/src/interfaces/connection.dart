/// Interface which is used to connect and disconnect from a printer.
abstract interface class ZebraConnectionInterface {
  /// Method used to connect to a printer.
  ///
  /// [address] is the mac address of the printer to connect to.
  ///
  /// If an error occurs while connecting to the printer, a [ZebraConnectionException]
  /// will be thrown.
  ///
  /// It returns `true` if the connection was successful, otherwise `false`.
  Future<bool> connect({required String address});

  /// Method used to disconnect from a printer.
  ///
  /// If an error occurs while disconnecting from the printer, a [ZebraConnectionException]
  /// will be thrown.
  ///
  /// It returns `true` if the disconnection was successful, otherwise `false`.
  Future<bool> disconnect();
}
