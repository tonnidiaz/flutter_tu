library tu;

export './utils/index.dart';
export 'widgets.dart';
export './utils/classes.dart';
export './utils/extensions.dart';
export './utils/theme.dart';
export './utils/imports.dart';
// export 'package:flutter_downloader/flutter_downloader.dart';
export 'package:get/get.dart' hide Response;
// export 'package:google_fonts/google_fonts.dart';
export 'package:go_router/go_router.dart';
export './widgets/updates_view.dart';

/// A Calculator.
class Calculator {
  /// Returns [value] plus 1.
  int addOne(int value) => value + 1;
}
