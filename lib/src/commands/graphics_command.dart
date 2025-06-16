import '../base/command.dart';

sealed class GraphicsCommand extends Command {
  /// Byte-width of image
  final int width;

  ///  Dot-height of image
  final int height;

  /// Horizontal starting position.
  final int x;

  /// Vertical starting position.
  final int y;

  /// The data representing the image.
  ///
  /// This can be the name of the stored image or raw data in hexadecimal format.
  final String data;

  const GraphicsCommand({
    this.width = 0,
    this.height = 0,
    this.x = 0,
    this.y = 0,
    required this.data,
  });
}

/// Command used for EXPANDED-GRAPHICS (or EG): Prints expanded graphics horizontally.
class EgCommand extends GraphicsCommand {
  /// Creates a command to print an image.
  ///
  /// [data] is the name of the stored image or raw data in hexadecimal format.
  const EgCommand({
    super.width = 0,
    super.height = 0,
    super.x = 0,
    super.y = 0,
    required super.data,
  });

  @override
  String toString() => appendReturn("EG $width $height $x $y $data");
}

/// Command used for VEXPANDED-GRAPHICS (or VEG): Prints expanded graphics vertically
class VegCommand extends GraphicsCommand {
  /// Creates a command to print an image.
  ///
  /// [data] is the name of the stored image or raw data in hexadecimal format.
  const VegCommand({
    super.width = 0,
    super.height = 0,
    super.x = 0,
    super.y = 0,
    required super.data,
  });

  @override
  String toString() => appendReturn("VEG $width $height $x $y $data");
}

/// Command used for COMPRESSED-GRAPHICS (or CG): Prints compressed graphics horizontally.
class CgCommand extends GraphicsCommand {
  /// Creates a command to print an image.
  ///
  /// [data] is the name of the stored image or raw data in hexadecimal format.
  const CgCommand({
    super.width = 0,
    super.height = 0,
    super.x = 0,
    super.y = 0,
    required super.data,
  });

  @override
  String toString() => appendReturn("CG $width $height $x $y $data");
}

/// Command used for VCOMPRESSED-GRAPHICS (or VCG): Prints compressed graphics vertically.
class VcgCommand extends GraphicsCommand {
  /// Creates a command to print an image.
  ///
  /// [data] is the name of the stored image or raw data in hexadecimal format.
  const VcgCommand({
    super.width = 0,
    super.height = 0,
    super.x = 0,
    super.y = 0,
    required super.data,
  });

  @override
  String toString() => appendReturn("VCG $width $height $x $y $data");
}
