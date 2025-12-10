abstract interface class ZebraPrinterInterface {
  /// Method used to write [data] to a printer.
  ///
  /// [data] is the code sent to the printer. It can be either ZPL or CPCL.
  ///
  /// If an error occurs while writing to the printer, a [ZebraWriteException]
  /// will be thrown.
  Future<bool> write({required String data});

  /// Method used to print an image from a file on the device.
  ///
  /// [filePath] is the location of the image file.
  /// [width] is the width of the image. If `0` then the image will be printed at its
  /// original width.
  /// [height] is the height of the image. If `0` then the image will be printed at its
  /// original height.
  /// [x] is the x-coordinate where the image will be printed.
  /// [y] is the y-coordinate where the image will be printed.
  /// [insideFormat] is a flag which indicates if the image should be printed inside the
  /// current format.
  ///
  /// If an error occurs while printing the image, a [ZebraPrintImageException]
  /// will be thrown.
  Future<bool> printImageFile({
    required String filePath,
    int width = 0,
    int height = 0,
    int x = 0,
    int y = 0,
    bool insideFormat = false,
  });

  /// Stores the specified image to the connected printer as a monochrome image.
  ///
  /// The image will be stored on the printer at `deviceDriveAndFileName` with the extension GRF.
  /// If a drive letter is not supplied, E will be used as the default
  /// (e.g. FILE becomes E:FILE.GRF).
  /// If an extension is supplied, it is ignored if it is not either BMP or PNG.
  /// If the extension is ignored, GRF will be used.
  /// If the image resolution is large (e.g. 1024x768) this method may take a long time to
  /// execute or throw an OutOfMemoryError exception.
  ///
  /// This is useful when printing images multiple times, as it avoids loading the image
  /// from the file system each time.
  ///
  /// [filePath] is the location of the image file, on the device controlling the printer.
  /// [deviceDriveAndFileName] is the name of the image to be stored in the printer's memory.
  /// [width] is the width of the image. If `0` then the image will be stored at its
  /// original width.
  /// [height] is the height of the image. If `0` then the image will be stored at its
  /// original height.
  Future<bool> storeImage({
    required String filePath,
    required String deviceDriveAndFileName,
    int width = 0,
    int height = 0,
  });
}
