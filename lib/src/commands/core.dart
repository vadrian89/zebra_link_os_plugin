/// Contains the core commands for printing documents.
///
/// These are commands which are used in most printing operations and are single text commands.
library;

import '../base/command.dart';

/// Used to print the document.
///
/// From documentation:
/// PRINT Command
/// The PRINT command terminates and prints the file. This must always be the last command
/// (except when in Line Print Mode). Upon execution of the PRINT command,
/// the printer will exit from a control session.
///
/// Be sure to terminate this and all commands with both carriage-return and line-feed characters
class PrintCommand extends Command {
  /// The command to print a document.
  ///
  /// This command is used to send a document to the printer.
  const PrintCommand();

  @override
  String toString() => appendReturn("PRINT");
}

/// Used to send the Form command.
///
/// The FORM command instructs the printer to feed to top of form after printing.
class FormCommand extends Command {
  /// The command to start a new form.
  ///
  /// This command is used to start a new form in the document.
  const FormCommand();

  @override
  String toString() => appendReturn("FORM");
}
