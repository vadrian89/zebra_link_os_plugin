import 'package:zebra_link_os_plugin/src/base/command.dart';

/// Class used to represent a line command.
///
/// From documentation:
/// Lines of any length, thickness, and angular orientation can be drawn using the LINE command.
/// Format:
/// `{command} {x0} {y0} {x1} {y1} {width}`
/// where:
/// {command}: Choose from the following:
/// LINE (or L): Prints a line.
/// {x0}: X-coordinate of the top-left corner.
/// {y0} Y-coordinate of the top-left corner.
/// {x1}: X-coordinate of:
/// - top right corner for horizontal.
/// - bottom left corner for vertical.
/// {y1}: Y-coordinate of:
/// - top right corner for horizontal.
/// - bottom left corner for vertical.
/// {width}: Unit-width (or thickness) of the line
final class LineCommand extends Command {
  /// X-coordinate of the starting point.
  final int x0;

  /// Y-coordinate of the starting point.
  final int y0;

  /// X-coordinate of the ending point.
  final int x1;

  /// Y-coordinate of the ending point.
  final int y1;

  /// Thickness of the line.
  final int width;

  /// Creates a line command.
  ///
  /// [x0] and [y0] are the coordinates of the starting point of the line,
  /// while [x1] and [y1] are the coordinates of the ending point.
  /// [width] is the thickness of the line.
  const LineCommand({
    this.x0 = 0,
    this.y0 = 0,
    this.x1 = 0,
    this.y1 = 0,
    this.width = 1,
  });

  @override
  String toString() => appendReturn("LINE $x0 $y0 $x1 $y1 $width");
}
