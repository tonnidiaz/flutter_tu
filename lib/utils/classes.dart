import 'package:get/get.dart';
import 'package:tu/controllers/app.ctrl.dart';
import 'package:tu/controllers/commom.ctrl.dart';

class Tu {
  static TuAppCtrl appCtrl = Get.put(TuAppCtrl());
  static TuProgressCtrl progressCtrl = Get.put(TuProgressCtrl());
}

//final tu = Tu();
