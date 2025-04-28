import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tu/tu.dart';

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

  final _darkMode = Rx(true);
  bool get darkMode => _darkMode.value;
  set darkMode(bool val) => _darkMode.value = val;

  _onDarkMode(bool p0) {
    if (!isMobile) {
      clog("[dark_mode] $p0");
      windowManager.setBrightness(p0 ? Brightness.dark : Brightness.light);
    }
  }

  @override
  void onInit() {
    super.onInit();
    _onDarkMode(_darkMode.value);
    _darkMode.listen(_onDarkMode);
  }
}
