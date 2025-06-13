import '../base/command.dart';

/// Represents a command to start a line in a document.
///
/// A label file always begins with the “!” character followed by an “x” offset parameter,
/// “x” and “y” axis resolutions, a label length and finally a quantity of labels to print.
/// The line containing these parameters is referred to as the Command Start Line.
///
/// Format:
/// <!> {offset} <200> <200> {height} {qty}
/// where:
/// <!>: Use ‘!’ to begin a control session.
/// {offset}:The horizontal offset for the entire label. This value causes all fields to be
/// offset horizontally
/// by the specified number of UNITS.
/// <200>:Horizontal resolution (in dots-per-inch).
/// <200>:Vertical resolution (in dots-per-inch).
/// {height}:The maximum height of the label.
/// The maximum label height is calculated by measuring from the bottom of the first black bar
/// (or label gap) to the top of the next black bar (or label gap). Then 1/16” [1.5mm] is subtracted
/// from this distance to obtain the maximum height. (In dots: subtract 12 dots on 203 d.p.i
/// printers; 18 dots on 306 d.p.i. printers)
class StartLineCommand extends Command {
  /// The horizontal offset for the entire label.
  final int offset;

  /// The x resolution (in dots-per-inch).
  ///
  /// This is set to 200 by default.
  final int xResolution;

  /// The y resolution (in dots-per-inch).
  ///
  /// This is set to 200 by default.
  final int yResolution;

  /// The height of the label.
  final int height;

  /// The number of labels to print.
  final int quantity;

  /// Creates a command to start a line in a document.
  const StartLineCommand({
    this.offset = 0,
    this.xResolution = 200,
    this.yResolution = 200,
    required this.height,
    this.quantity = 1,
  });

  @override
  String toString() => appendReturn("! $offset $xResolution $yResolution $height $quantity");
}
