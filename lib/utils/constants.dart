import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'index.dart';

class TuPage {
  Widget widget;
  bool inList;
  bool isAction;
  String? to;
  IconData? icon;
  String? label;
  TuPage(this.to, this.widget,
      {this.icon, this.inList = true, this.isAction = false, this.label});
}

bool backEnabled = true;

const String tag = "Tu";
const String package = "com.tb.tmeta";
const double bottomSheetH = 150;
const double bottomBarH = 45;
const double sidebarW = 45;
const double iconSize = 25;
const double topMargin = 5;
const double splashRadius = iconSize;
bool dev = kDebugMode;

final bool isMobile = Platform.isAndroid || Platform.isIOS || dev;
const defaultPadding = EdgeInsets.all(8);
const defaultPadding2 = EdgeInsets.all(14);
Size screenSize(BuildContext context) {
  return MediaQuery.of(context).size;
}

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
double appBarH = kToolbarHeight;

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

const localhost = "http://172.16.10.204";

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
