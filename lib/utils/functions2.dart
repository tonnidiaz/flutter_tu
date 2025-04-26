import 'package:dio/dio.dart';
import 'package:tu/tu.dart';
import "package:permission_handler/permission_handler.dart";
import 'package:get/get.dart';
import 'dart:io';
import 'package:path/path.dart' as path;

Future<bool> requestStoragePermission() async {
  clog("Requesting...");

  return await Permission.storage.request().isGranted;
}

Future checkUpdates(
    {required String appVersion,
    required String appId,
    required String appName,
    bool showLoader = true}) async {
  final context = Get.overlayContext;

  try {
    final cancelToken = CancelToken();
    if (showLoader) {
      showProgressSheet(
          msg: "Checking updates...",
          onDismiss: () {
            clog('Dizmissed');
            cancelToken.cancel("Dismissed");
          });
    }

    if (dev) await sleep(2500);
    final res = await (await bassDio()).get("/api/app/updates/check",
        queryParameters: {
          "uid": appId,
          "v": appVersion,
        },
        cancelToken: cancelToken);
    final ret = res.data.runtimeType == String ? null : res.data;
    if (showLoader) gpop();
    Get.bottomSheet(UpdatesView3(
      update: ret,
      appName: appName,
    ));
  } catch (e) {
    if (showLoader && context?.mounted == true) {
      errorHandler(e: e, context: context);
    } else {
      clog(e);
    }
  }
}

String getAssetsDir() => path.join(path.dirname(Platform.resolvedExecutable),
    "data", "flutter_assets", "assets");

String getBinariesDir() {
  final assetsDir = getAssetsDir();

  String platFold = "";
  if (Platform.isLinux) {
    platFold = "linux";
  } else if (Platform.isWindows) {
    platFold = "win";
  } else if (Platform.isMacOS) {
    platFold = "macos";
  }
  return path.join(assetsDir, "bin", platFold);
}

String getFilename(String fullpath) {
  return path.basename(fullpath);
}
