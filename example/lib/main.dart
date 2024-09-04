import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:zebra_link_os_plugin/zebra_link_os.dart';

import 'bluetooth_permissions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final ValueNotifier<bool> _discoverFinishedNotifier;
  late final ZebraLinkOs _plugin = ZebraLinkOs();
  late final Future<bool> _requestedPermissions;
  late final ValueNotifier<Set<DiscoveredPrinter>> _printersNotifier;
  DiscoveredPrinter? _selectedPrinter;

  @override
  void initState() {
    super.initState();
    _requestedPermissions = _requestPermissions();
    _discoverFinishedNotifier = ValueNotifier(true);
    _printersNotifier = ValueNotifier(const {});
  }

  @override
  void dispose() {
    _plugin.dispose();
    _printersNotifier.dispose();
    _discoverFinishedNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: FutureBuilder(
          future: _requestedPermissions,
          builder: (context, snapshot) {
            return Scaffold(
              appBar: AppBar(
                title: const Text("Plugin example app"),
              ),
              body: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      switch (snapshot.connectionState) {
                        ConnectionState.done =>
                          snapshot.data == true ? "Permissions granted" : "Permissions denied",
                        _ => "Requesting permissions...",
                      },
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 16),
                    ValueListenableBuilder(
                      valueListenable: _discoverFinishedNotifier,
                      builder: (context, value, child) {
                        if (!value) return const CircularProgressIndicator();
                        return ValueListenableBuilder(
                          valueListenable: _printersNotifier,
                          builder: (context, printers, child) => ListView.builder(
                            shrinkWrap: true,
                            itemCount: printers.length,
                            itemBuilder: (context, index) {
                              final printer =
                                  printers.elementAt(index) as DiscoveredPrinterBluetooth;
                              return RadioListTile(
                                groupValue: _selectedPrinter,
                                value: printer,
                                title: Text(printer.friendlyName),
                                onChanged: (value) => setState(() => _selectedPrinter = value),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              bottomNavigationBar: ValueListenableBuilder<bool>(
                valueListenable: _discoverFinishedNotifier,
                builder: (context, finished, child) => ButtonBar(
                  alignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: switch (snapshot.connectionState) {
                        ConnectionState.done =>
                          finished && (snapshot.data == true) && (_selectedPrinter != null)
                              ? _printTest
                              : null,
                        _ => null,
                      },
                      child: const Text("Print"),
                    ),
                    ElevatedButton(
                      onPressed: switch (snapshot.connectionState) {
                        ConnectionState.done =>
                          finished && (snapshot.data == true) && (_selectedPrinter != null)
                              ? _printTestImage
                              : null,
                        _ => null,
                      },
                      child: const Text("Print image"),
                    ),
                    ElevatedButton(
                      onPressed: switch (snapshot.connectionState) {
                        ConnectionState.done =>
                          finished || snapshot.data == true ? _startDiscovery : null,
                        _ => null,
                      },
                      child: const Text("Find printers"),
                    ),
                    ElevatedButton(
                      onPressed: switch (snapshot.connectionState) {
                        ConnectionState.done =>
                          finished && (snapshot.data == true) && (_selectedPrinter != null)
                              ? () => _plugin.connect(address: _selectedPrinter!.address)
                              : null,
                        _ => null,
                      },
                      child: const Text("Connect"),
                    ),
                    ElevatedButton(
                      onPressed: _plugin.disconnect,
                      child: const Text("Disconnect"),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );

  Future<void> _printTestImage() async {
    const fileName = "print-test.png";
    final bytes = await rootBundle.load("assets/$fileName");
    final dir = await getApplicationDocumentsDirectory();
    final filePath = "${dir.path}/$fileName";
    final file = await File(filePath).writeAsBytes(bytes.buffer.asUint8List());
    await Future.delayed(const Duration(milliseconds: 500));
    await _plugin.printImageFile(filePath: file.path, x: 10);
    await Future.delayed(const Duration(milliseconds: 500));
  }

  void _printTest() {
    var string = "! 0 200 200 210 1\r\n";
    string += "TEXT 4 0 30 40 Ola Field OS!!1\r\n";
    string += "PRINT\r\n";
    _plugin.write(data: string);
  }

  Future<void> _startDiscovery() async {
    _discoverFinishedNotifier.value = false;
    _plugin.startDiscovery().then((value) {
      _discoverFinishedNotifier.value = true;
      _printersNotifier.value = {...?value};
    });
  }

  Future<bool> _requestPermissions() async {
    final isEnabled = await BluetoothPermissions.isEnabled;
    if (!isEnabled) return false;
    final isScanGranted = await BluetoothPermissions.isScanPermissionGranted;
    if (!isScanGranted) return false;
    final isConnectGranted = await BluetoothPermissions.isConnectPermissionGranted;
    if (!isConnectGranted) return false;
    return await BluetoothPermissions.isLocationPermissionGranted;
  }
}
