import 'package:tu/tu.dart';

extension TuDurationExt on Duration {
  String format() {
    return toString().split('.').first.padLeft(8, "0");
  }
}

extension E on dynamic {
  /// Returns true is object is not null
  bool get isNotNull => this != null;

  TuTheme get theme => TuTheme.instance;
  TuColors get colors => TuTheme.instance.colors;
  Styles get styles => TuTheme.instance.styles;
  bool get dark => Tu.appCtrl.darkMode;
}
