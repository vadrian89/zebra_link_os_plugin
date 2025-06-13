/// The base class for all commands in the application.
abstract class Command {
  static const String _returnString = "\r\n";

  const Command();

  /// Returns the command as a string, appending a carriage return and line feed.
  ///
  /// The command string is formatted as `{command}\r\n`.
  String appendReturn(String command) => "$command$_returnString";
}
