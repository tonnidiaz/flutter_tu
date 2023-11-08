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
    double height = appBarH,
    double? elevation,
    List<Widget> actions = const []}) {
  final BarCtrl appBarCtrl = Get.find();
  return PreferredSize(
    preferredSize: Size.fromHeight(height),
    child: Obx(
      () => AppBar(
        elevation: elevation,
//        leadingWidth: appBarH - 5,
        //titleSpacing: 5,
        centerTitle: centerTitle,
        leading: appBarCtrl.selected.value.isNotEmpty
            ? IconButton(
                padding: EdgeInsets.zero,
                splashRadius: 20,
                onPressed: () {
                  appBarCtrl.setSelected([]);
                },
                icon: const Icon(Icons.close))
            : null,
        title: appBarCtrl.selected.value.isNotEmpty
            ? Text(
                "${appBarCtrl.selected.value.length}",
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
