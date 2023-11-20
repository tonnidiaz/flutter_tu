import 'package:tu/controllers/app.ctrl.dart';
import 'package:tu/controllers/commom.ctrl.dart';
import 'package:tu/tu.dart';

class Tu {
  static TuAppCtrl appCtrl = Get.put(TuAppCtrl());
  static TuProgressCtrl progressCtrl = Get.put(TuProgressCtrl());
  static TuColors colors = TuTheme.instance.colors;
}

//final tu = Tu();
