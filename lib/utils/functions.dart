import 'dart:io';
import 'dart:math';

import 'package:another_flushbar/flushbar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:tu/utils/colors.dart';
import 'package:via_logger/log_record.dart';
import 'package:via_logger/logger.dart';
import 'package:via_logger/output.dart';
import '../widgets.dart';
import '/utils/constants.dart';
import 'package:window_manager/window_manager.dart';

void clog(dynamic p) {
  debugPrint("$tag: $p");
}

void setupWindowManager() async {
  if (Platform.isAndroid) return;

  // Must add this line.
  await windowManager.ensureInitialized();

  WindowOptions windowOptions = WindowOptions(
    minimumSize: isMobile ? const Size(288, 533) : null,
    maximumSize: isMobile ? const Size(288, 533) : null,
    size: isMobile ? null : const Size(700, 400),
    center: true,
    //skipTaskbar: false,
    //titleBarStyle: TitleBarStyle.hidden
  );
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });
}

String formatDate(dynamic date) {
  final DateFormat formatter = DateFormat("yyyy-MM-dd").add_jm();
  final DateTime mDate =
      date.runtimeType == String ? DateTime.parse(date) : date;
  return formatter.format(mDate.toLocal());
}

String camelToSentence(String text) {
  return text.replaceAllMapped(RegExp(r"^([a-z])|[A-Z]"),
      (Match m) => m[1] == null ? " ${m[0]}" : m[1]!.toUpperCase());
}

class Console extends Output {
  @override
  void output(LogRecord record) {
    ///Custom print style
    debugPrint('[${record.path}:${record.lineNumber}] ${record.message}');
  }
}

setupLogger() {
  final List<Output> engines = [Console()];
  Logger.setEngines(engines);
}

Flushbar showToast(String msg,
    {bool isErr = false, int duration = 2, bool autoDismiss = true}) {
  // final appCtrl = MainApp.appCtrl;
  return Flushbar(
    backgroundColor: TuColors.bg(dark: false),
    messageColor: isErr ? Colors.red : TuColors.text(dark: false),
    message: msg,
    duration: autoDismiss ? Duration(seconds: duration) : null,
    animationDuration: const Duration(milliseconds: 500),
    onStatusChanged: (status) {},
  );
}

bool isNumeric(dynamic s) {
  if (s == null) {
    return false;
  }
  return double.tryParse("$s") != null;
}

void pushTo(Widget widget) {
  Get.to(widget);
}

void pushNamed(String name, {Object? arguments}) {
  Get.toNamed(name, arguments: arguments);
}

double roundDouble(double value, int places) {
  double mod = pow(10.0, places).toDouble();
  return ((value * mod).round().toDouble() / mod);
}

void handleDioException(
    {BuildContext? context, required DioException exception, String? msg}) {
  clog(exception.response);
  if (exception.response != null &&
      "${exception.response!.data}".startsWith("tuned")) {
    showToast("${exception.response!.data.split("tuned:").last}", isErr: true)
        .show(context ?? Get.overlayContext!);
  } else {
    showToast(msg ?? "${exception.message ?? exception.response}", isErr: true)
        .show(context ?? Get.overlayContext!);
  }
}

void errorHandler({required e, BuildContext? context, String? msg}) {
  Logger.info(e);
  // if (!(context?.mounted == true)) return;
  if (e.runtimeType == DioException) {
    handleDioException(
        context: context, exception: e as DioException, msg: msg);
  } else {
    showToast(msg ?? "$e", isErr: false).show(context ?? Get.overlayContext!);
  }
}

class TuFuncs {
  static void showBottomSheet(
      {required BuildContext context,
      bool full = true,
      required Widget widget}) {
    showModalBottomSheet(
        useSafeArea: true,
        isScrollControlled: full,
        context: context,
        builder: (context) => widget);
  }

  static dialog(BuildContext context, Widget widget) {
    return showDialog(
        useRootNavigator: false,
        context: context,
        builder: (context) => widget);
  }
}

Future<String> getAppVersion() async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  return packageInfo.version;
}

void pop(BuildContext context) {
  return Navigator.pop(context);
}

void gpop() {
  Get.back();
}

sleep(int ms) async {
  return await Future.delayed(Duration(milliseconds: ms));
}

void showProgressSheet({String? msg, bool dismissable = false}) {
  Get.bottomSheet(ProgressSheet(msg: msg, dismissable: dismissable),
      isDismissible: false);
}

Future copyToClipboard(String text) async {
  ClipboardData data = ClipboardData(text: text);
  await Clipboard.setData(data);
  clog('Copied');
}
