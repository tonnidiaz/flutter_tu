extension TuDurationExt on Duration {
  String format() {
    return toString().split('.').first.padLeft(8, "0");
  }
}

extension E on Function? {
  bool get isNotNull => this != null;
}
