import 'package:flutter/foundation.dart';

import '../base/command.dart';
import '../commands/core.dart';

/// Class used to build the command line to be sent to the printer.
@immutable
class CommandLineBuilder {
  late final StringBuffer _buffer;

  CommandLineBuilder._(String? initialValue) {
    _buffer = StringBuffer(initialValue ?? "");
  }

  factory CommandLineBuilder(Command? initialCommand) => CommandLineBuilder._(
        initialCommand?.toString(),
      );

  /// Appends a command to the command line and returns a new instance of [CommandLineBuilder].
  CommandLineBuilder append(Command command) {
    _buffer.write(command.toString());
    return CommandLineBuilder._(_buffer.toString());
  }

  /// Shorthand for returning the command which should be sent to the printer.
  ///
  /// This method uses [append] to add a `PrintCommand` to the command line and calls `toString()`
  /// to return the entire command line as a string.
  String toWrittenString() => append(const PrintCommand()).toString();

  @override
  String toString() => _buffer.toString();
}
