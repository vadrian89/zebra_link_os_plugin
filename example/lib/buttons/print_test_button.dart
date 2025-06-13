import 'package:flutter/material.dart';
import 'package:zebra_link_os_plugin/builders.dart';
import 'package:zebra_link_os_plugin/commands.dart';
import 'package:zebra_link_os_plugin/zebra_link_os.dart';

import 'app_elevated_button.dart';

class PrintTestButton extends StatelessWidget {
  final ZebraLinkOs plugin;
  final bool enabled;

  const PrintTestButton({
    super.key,
    required this.plugin,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) => AppElevatedButton.print(enabled ? _print : null);

  void _print() {
    var builder = CommandLineBuilder(const StartLineCommand(height: 210));
    builder = builder.append(const TextCommand(
      font: "4",
      size: 0,
      x: 30,
      y: 40,
      data: "Hello world!",
    ));
    builder = builder.append(const PatternCommand.horizontalLines());
    builder = builder.append(const LineCommand(
      x0: 31,
      x1: 800,
      width: 2,
    ));

    plugin.write(data: builder.toWrittenString());
  }
}
