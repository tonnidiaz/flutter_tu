import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TuAppCtrl extends GetxController {
  var count = 0.obs;
  void increment() {
    count.value++;
  }

  var title = "Tunedbass app".obs;
  void setTitle(String val) {
    title.value = val;
  }

  var navItems = <Widget>[].obs;
  void setNavItems(List<Widget> val) {
    navItems.value = val;
  }

  var isLoading = false.obs;
  void setIsLoading(bool val) {
    isLoading.value = val;
    backEnabled.value = !val;
  }

  var backEnabled = true.obs;
  void setBackEnabled(bool val) {
    backEnabled.value = val;
  }

  final darkMode = RxBool(true);
  void setDarkMode(bool val) {
    darkMode.value = val;
  }
}
