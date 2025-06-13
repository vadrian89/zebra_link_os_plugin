import '../base/command.dart';

/// Class used to represent a pattern command.
///
/// From documentation:
/// The PATTERN command is used with the LINE and SCALE-TEXT commands to change the patterns used
/// to fill these shapes. Valid pattern values are listed below.
///
/// Format:
/// `{command} {pattern number}`
/// where:
/// {command}: PATTERN
/// {pattern number}: Choose from the following:
/// 100 Filled (solid black/default pattern).
/// 101 Horizontal lines.
/// 102 Vertical lines.
/// 103 Right rising diagonal lines.
/// 104 Left rising diagonal lines.
/// 105 Square pattern.
/// 106 Cross hatch pattern.
///
/// To use this command, you can create an instance of the desired pattern and then use it
/// with [Line] or [ScaleText] commands that support patterns.
sealed class PatternCommand extends Command {
  const PatternCommand();

  /// 100 Filled (solid black/default pattern)
  const factory PatternCommand.filled() = _FilledPattern;

  /// 101 Horizontal lines
  const factory PatternCommand.horizontalLines() = _HorizontalLinesPattern;

  /// 102 Vertical lines
  const factory PatternCommand.verticalLines() = _VerticalLinesPattern;

  /// 103 Right rising diagonal lines
  const factory PatternCommand.rightRisingDiagonalLines() = _RightRisingDiagonalLinesPattern;

  /// 104 Left rising diagonal lines
  const factory PatternCommand.leftRisingDiagonalLines() = _LeftRisingDiagonalLinesPattern;

  /// 105 Square pattern
  const factory PatternCommand.square() = _SquarePattern;

  /// 106 Cross hatch pattern
  const factory PatternCommand.crossHatch() = _CrossHatchPattern;

  @override
  String toString() => "Pattern";
}

/// 100 Filled (solid black/default pattern).
class _FilledPattern extends PatternCommand {
  const _FilledPattern();

  @override
  String toString() => appendReturn("${super.toString()} 101");
}

/// 101 Horizontal lines.
class _HorizontalLinesPattern extends PatternCommand {
  const _HorizontalLinesPattern();

  @override
  String toString() => appendReturn("${super.toString()} 102");
}

/// 102 Vertical lines.
class _VerticalLinesPattern extends PatternCommand {
  const _VerticalLinesPattern();

  @override
  String toString() => appendReturn("${super.toString()} 103");
}

/// 103 Right rising diagonal lines.
class _RightRisingDiagonalLinesPattern extends PatternCommand {
  const _RightRisingDiagonalLinesPattern();

  @override
  String toString() => appendReturn("${super.toString()} 104");
}

/// 104 Left rising diagonal lines.
class _LeftRisingDiagonalLinesPattern extends PatternCommand {
  const _LeftRisingDiagonalLinesPattern();

  @override
  String toString() => appendReturn("${super.toString()} 105");
}

/// 105 Square pattern.
class _SquarePattern extends PatternCommand {
  const _SquarePattern();

  @override
  String toString() => appendReturn("${super.toString()} 106");
}

/// 106 Cross hatch pattern.
class _CrossHatchPattern extends PatternCommand {
  const _CrossHatchPattern();

  @override
  String toString() => appendReturn("${super.toString()} 107");
}
