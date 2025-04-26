import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tu/tu.dart';
import 'package:get/get.dart';
import 'index.dart';
export 'package:window_manager/window_manager.dart';

class TuPage {
  Widget widget;
  bool inList;
  bool isAction;
  String to;
  IconData? icon;
  String? label;
  String? svg;
  TuPage(this.to, this.widget,
      {this.icon,
      this.inList = true,
      this.isAction = false,
      this.label,
      this.svg});
}

bool backEnabled = true;

const String tag = "Tu";
const String package = "com.tb.tmeta";
const double bottomSheetH = 150;
const double bottomBarH = 95;
const double sidebarW = 45;
const double iconSize = 24; //30;
const double topMargin = 5;
const double splashRadius = iconSize + 10;
double statusBarHeight() => 25;
bool dev = kDebugMode;

final bool isMobile = kIsWeb ? false : Platform.isAndroid || Platform.isIOS;
const defaultPadding = EdgeInsets.all(8);
const defaultPadding2 = EdgeInsets.all(14);
Size screenSize(BuildContext context) {
  return MediaQuery.of(context).size;
}

BorderRadius defaultBorderRadius = BorderRadius.circular(7);

final defaultMenu = [
  MenuItemButton(
    onPressed: () {
      clog("Open clicked");
    },
    shortcut: const SingleActivator(LogicalKeyboardKey.keyO, control: true),
    child: const Text("Open"),
  ),
  MenuItemButton(
    onPressed: () {
      clog("Open clicked");
    },
    shortcut: const SingleActivator(LogicalKeyboardKey.keyS, control: true),
    child: const Text("Save"),
  ),
];

double statusBarH(BuildContext context) =>
    MediaQuery.of(context).viewPadding.top;
double appBarH = 38;
double appBarTextSize = 12;

class SelectItem {
  final String label;
  final dynamic value;
  SelectItem(this.label, this.value);
}

double keyboardPadding(BuildContext context) {
  return MediaQuery.of(context).viewInsets.bottom;
}

final dio = Dio();
const String githubURL =
    "https://raw.githubusercontent.com/tonnidiaz/tunedapps/main/meta.json";

const localhost = "http://192.168.58.1";

Future<String> tbURL() async {
  if (dev) return "$localhost:3000";
  final res = await dio.get(
    githubURL,
  );
  return jsonDecode(res.data)["baseURL"];
}

Future<Dio> bassDio() async {
  return Dio(BaseOptions(baseUrl: await tbURL()));
}

/*bool autoCheck() {
  final acu = appBox!.get("AUTO_CHECK_UPDATES");
  final autoCheck = acu == null || acu;
  return autoCheck;
}

*/

List<Object> progressSheets = [];

BuildContext getCtx() => Get.overlayContext!;
const List<String> videoExtensions = [
  "mp4",
  "mov",
  "avi",
  "wmv",
  "flv",
  "mkv",
  "webm",
  "mpeg",
  "mpg",
  "3gp",
  "ogv",
  "ts",
  "m4v",
  "f4v",
  "vob",
  "rm",
  "rmvb",
  "asf",
  "divx"
];

final platExt = Platform.isWindows ? ".exe" : "";
Directory? tempDir;
getTempDir() async {
  tempDir = await getTemporaryDirectory();
}

final tuDebouncer = TuDebouncer(delay: const Duration(milliseconds: 500));
