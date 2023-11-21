import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/constants.dart';

class BarCtrl extends GetxController {
  final selected = Rx<List>([]);
  void setSelected(List val) => selected.value = val;
}

PreferredSizeWidget tuAppbar(
    {Widget? title,
    bool showCart = true,
    bool? centerTitle,
    double elevation = 1,
    PreferredSizeWidget? bottom,
    List<Widget> actions = const []}) {
  final BarCtrl barCtrl = Get.find();
  return PreferredSize(
    preferredSize: Size.fromHeight(appBarH),
    child: Obx(
      () => AppBar(
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
            : null,
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
