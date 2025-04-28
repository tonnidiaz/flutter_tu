class TuRootIsarSchema {
  late DateTime createdAt;
  late DateTime updatedAt;

  TuRootIsarSchema() {
    final now = DateTime.now();
    createdAt = now;
    updatedAt = now;
  }

  void touch() {
    updatedAt = DateTime.now();
  }
}
