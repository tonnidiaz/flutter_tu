import 'dart:io';

import 'package:path/path.dart' as pth;
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'functions.dart';

Future configIsar(
    {required final List<CollectionSchema<dynamic>> schemas}) async {
  final String mPath =
      pth.join((await getApplicationSupportDirectory()).path, ".db");
  final realDir = Directory.fromUri(Uri.directory(mPath));
  // Create directory if it does not exist already on desktop
  clog("THE ISAR DIR IS: $realDir\n$mPath");
  if (!(await realDir.exists())) {
    realDir.createSync(recursive: true);
    clog("DIRECTORY CREATED");
  }

  final isar = await Isar.open(schemas,
      name: "app", directory: realDir.path, inspector: true);
  clog(isar.path);
  clog("ISAR CONFIGURED");
  return isar;
}
