import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:zebra_link_os_plugin/zebra_link_os.dart';

import 'app_elevated_button.dart';

class PrintImageButton extends StatelessWidget {
  final ZebraLinkOs plugin;
  final bool enabled;

  const PrintImageButton({
    super.key,
    required this.plugin,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) => AppElevatedButton.printImage(
        enabled ? _printTestImage : null,
      );

  Future<void> _printTestImage() async {
    const fileName = "print-test.png";
    final bytes = await rootBundle.load("assets/$fileName");
    final dir = await getApplicationDocumentsDirectory();
    final filePath = "${dir.path}/$fileName";
    final file = await File(filePath).writeAsBytes(bytes.buffer.asUint8List());
    await Future.delayed(const Duration(milliseconds: 500));
    await plugin.printImageFile(filePath: file.path, x: 10);
    await Future.delayed(const Duration(milliseconds: 500));
  }
}
