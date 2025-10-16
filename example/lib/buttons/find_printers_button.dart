import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:zebra_link_os_plugin/zebra_link_os.dart';

import 'app_elevated_button.dart';

class FindPrintersButton extends StatelessWidget {
  final ZebraLinkOs plugin;
  final bool enabled;
  final ValueChanged<bool> onDiscoveryFinished;
  final ValueChanged<Set<DiscoveredPrinter>> onPrintersChanged;

  const FindPrintersButton({
    super.key,
    required this.plugin,
    this.enabled = true,
    required this.onDiscoveryFinished,
    required this.onPrintersChanged,
  });

  @override
  Widget build(BuildContext context) => AppElevatedButton.findPrinters(
        enabled ? _startDiscovery : null,
      );

  Future<void> _startDiscovery() async {
    try {
      onDiscoveryFinished(false);
      await plugin.startDiscovery().then((value) {
        onPrintersChanged({...?value});
        onDiscoveryFinished(true);
      });
    } on ZebraLinkOsException catch (e) {
      log(e.message, stackTrace: e.stackTrace);
    }
  }
}
