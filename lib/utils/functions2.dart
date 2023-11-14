import 'package:get/get.dart';
import 'package:tu/tu.dart';
import "package:permission_handler/permission_handler.dart";

import '../widgets/updates_view.dart';

Future requestStoragePermission() async {
  clog("Requesting...");

  return await Permission.storage.request().isGranted;
}

Future checkUpdates({
  required String appVersion,
  required String appId,
  required String appName,
}) async {
  final context = Get.overlayContext;

  try {
    showProgressSheet(msg: "Checking updates...");

    final res =
        await (await bassDio()).get("/api/app/updates/check", queryParameters: {
      "uid": appId,
      "v": appVersion,
    });
    final ret = res.data.runtimeType == String ? null : res.data;
    gpop();
    Get.bottomSheet(UpdatesView3(
      update: ret,
      appName: appName,
    ));
  } catch (e) {
    gpop();
    if (context?.mounted == true) {
      errorHandler(e: e, context: context);
    }
  }
}
