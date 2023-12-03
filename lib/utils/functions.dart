import 'dart:io';
import 'dart:math';
import 'package:device_info_plus/device_info_plus.dart';

import 'package:another_flushbar/flushbar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:tu/tu.dart';
import 'package:window_manager/window_manager.dart';

void clog(dynamic p) {
  debugPrint("\n$tag: $p\n");
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

Flushbar showToast(String msg,
    {bool isErr = false, int duration = 2, bool autoDismiss = true}) {
  // final appCtrl = MainApp.appCtrl;
  return Flushbar(
    backgroundColor: Tu.colors.bg2,
    margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
    borderRadius: BorderRadius.circular(5),
    /* boxShadows: const [
      BoxShadow(
          //color: Color.fromRGBO(36, 36, 36, 0.438),
          offset: Offset(0, -2),
          blurRadius: 1,
          spreadRadius: 1)
    ], */
    messageColor: isErr ? Colors.red : Tu.colors.onBackground,
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

Future pushTo(Widget widget) async {
  return Get.to(widget);
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
  clog("EXCEPTION RESPONSE:\n");
  clog(exception.response);
  String? respMsg;
  if (exception.type == DioExceptionType.connectionError) {
    respMsg = "Connection error";
  } else if (exception.type == DioExceptionType.connectionTimeout) {
    respMsg = "Connection timedout";
  } else if (exception.response != null) {
    final resp = exception.response!;

    if ("${resp.data}".startsWith("tuned")) {
      respMsg = "${exception.response!.data.split("tuned:").last}";
    } else if (resp.statusMessage != null) {
      respMsg = resp.statusMessage;
    }
  } else {
    respMsg = exception.message;
  }
  showToast(respMsg ?? msg ?? "Something went wrong", isErr: true)
      .show(context ?? Get.overlayContext!);
}

void errorHandler({required e, BuildContext? context, String? msg}) {
  clog(e);
  if (progressSheets.isEmpty) return;
  gpop();

  // if (!(context?.mounted == true)) return;
  if (e.runtimeType == DioException) {
    handleDioException(
        context: context, exception: e as DioException, msg: msg);
  } else {
    showToast(msg ?? "Something went wrong", isErr: false)
        .show(context ?? Get.overlayContext!);
  }
}

class TuFuncs {
  static dialog(BuildContext context, Widget widget) async {
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

Future<String> getUserId() async {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  final id = Platform.isAndroid
      ? (await deviceInfo.androidInfo).id
      : (await deviceInfo.iosInfo).identifierForVendor!;
  clog(id);
  return 'nfo.data';
}

void pop(BuildContext context) {
  return Navigator.pop(context);
}

void gpop({dynamic ret}) {
  Get.back(result: ret);
}

sleep(int ms) async {
  return await Future.delayed(Duration(milliseconds: ms));
}

void showProgressSheet(
    {String? msg, bool dismissable = false, Function()? onDismiss}) {
  Get.bottomSheet(
    ProgressSheet(msg: msg, dismissable: dismissable, onDismiss: onDismiss),
    isDismissible: false,
  );
}

Future copyToClipboard(String text) async {
  ClipboardData data = ClipboardData(text: text);
  await Clipboard.setData(data);
  clog('Copied');
}
