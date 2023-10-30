import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'index.dart';

class TuPage {
  Widget widget;
  bool inList;
  bool isAction;
  String name;
  IconData? icon;
  TuPage(this.name, this.widget,
      {this.icon, this.inList = true, this.isAction = false});
}

const String tag = "Tunedbass";
const String package = "com.tb.tmeta";
const double bottomSheetH = 150;
const double bottomBarH = 45;
const double sidebarW = 45;
const double iconSize = 25;
const double splashRadius = iconSize;

final bool isMobile = Platform.isAndroid || Platform.isIOS;
const defaultPadding = EdgeInsets.all(8);
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

const double appBarH = kToolbarHeight;
