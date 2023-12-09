import 'package:flutter/material.dart';
import 'package:tu/controllers/app.ctrl.dart';
import 'package:tu/controllers/commom.ctrl.dart';
import 'package:tu/tu.dart';

class Tu {
  static TuAppCtrl appCtrl = Get.put(TuAppCtrl());
  static TuProgressCtrl progressCtrl = Get.put(TuProgressCtrl());
  static TuColors colors = TuTheme.instance.colors;
  static Styles styles = TuTheme.instance.styles;

  static bottomSheet(Widget sheet,
      {bool fullScreen = false,
      bool isDismissible = true,
      bool enableDrag = true,
      bool? showDragHandle,
      bool useSafeArea = false,
      BuildContext? context}) {
    Get.bottomSheet(sheet,
        isScrollControlled: fullScreen,
        ignoreSafeArea: !fullScreen,
        isDismissible: isDismissible,
        enableDrag: enableDrag);
  }

  static dialog(Widget sheet,
      {bool isScrollControlled = false,
      bool useRootNavigator = false,
      bool isDismissible = true,
      bool enableDrag = true,
      bool? showDragHandle,
      bool useSafeArea = false,
      BuildContext? context}) {
    showDialog(
      useRootNavigator: false,
      context: context ?? getCtx(),
      builder: (_) => sheet,
      useSafeArea: useSafeArea,
    );
  }
}

//final tu = Tu();
