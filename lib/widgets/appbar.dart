import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tu/tu.dart';

import '../utils/constants.dart';

class BarCtrl extends GetxController {
  final selected = Rx<List>([]);
  void setSelected(List val) => selected.value = val;
}

PreferredSizeWidget tuAppbar(
    {Widget? title,
    bool showCart = true,
    bool? centerTitle,
    Widget? leading,
    double? elevation,
    PreferredSizeWidget? bottom,
    Color? bgColor,
    bool hasBg = false,
    List<Widget> actions = const []}) {
  final BarCtrl barCtrl = Get.find();
  return PreferredSize(
    preferredSize: Size.fromHeight(appBarH),
    child: Obx(
      () => AppBar(
        backgroundColor: hasBg ? Tu.colors.bg1 : bgColor,
        elevation: elevation,
        centerTitle: barCtrl.selected.value.isNotEmpty ? false : centerTitle,
        bottom: bottom,
        leading: barCtrl.selected.value.isNotEmpty
            ? IconButton(
                padding: EdgeInsets.zero,
                splashRadius: 20,
                onPressed: () {
                  barCtrl.setSelected([]);
                },
                icon: const Icon(Icons.close))
            : leading,
        title: barCtrl.selected.value.isNotEmpty
            ? Text(
                "${barCtrl.selected.value.length}",
              )
            : title,
        actions: [
          ...actions,
          // mX(8)
        ],
      ),
    ),
  );
}
