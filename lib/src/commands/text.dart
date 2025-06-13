import '../base/command.dart';

/// Represents a text command for printing text on a label.
///
/// The TEXT command is used to place text on a label. This command and its variants control
/// the specific font number and size used, the location of the text on the label,
/// and the orientation of this text. Standard resident fonts can be rotated
/// in 90˚ increments as shown in the example.
/// Format:
/// {command} {font} {size} {x} {y} {data}
/// where:
/// {command}: Choose from the following:
/// {font}: Name/number of the font.
/// {size}: Size identifier for the font.
/// {x}: Horizontal starting position.
/// {y}: Vertical starting position.
/// {data}: The text to be printed.
///
/// There are multiple variants of the TEXT command, such as:
/// - TEXT: Standard text command.
/// - VTEXT: Text command with rotation.
/// - TEXT90: Text command rotated 90 degrees counterclockwise.
/// - TEXT180: Text command rotated 180 degrees counterclockwise (upside down).
/// - TEXT270: Text command rotated 270 degrees counterclockwise.
class TextCommand extends Command {
  /// Name/number of the font
  final String font;

  /// Size identifier for the font
  final int size;

  /// Horizontal starting position
  final int x;

  /// Vertical starting position
  final int y;

  /// The text to be printed
  final String data;

  const TextCommand({
    required this.font,
    required this.size,
    this.x = 0,
    this.y = 0,
    required this.data,
  });

  @override
  String toString() => appendReturn("TEXT $font $size $x $y $data");
}
