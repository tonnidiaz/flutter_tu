import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tu/tu.dart';

class TuInkwell extends StatelessWidget {
  final double radius;
  final Object? item;
  final Color? color;
  final Widget? child;
  final EdgeInsetsGeometry padding;
  const TuInkwell(
      {super.key,
      this.radius = 0,
      this.item,
      this.color,
      this.child,
      this.padding = EdgeInsets.zero});

  @override
  Widget build(BuildContext context) {
    final barCtrl = Get.find<BarCtrl>();

    final bradius = BorderRadius.circular(radius);
    InkWell inkWell({Widget? child}) => InkWell(
          onTap: () {
            if (item == null) return;
            var selectedMsgs = barCtrl.selected.value;
            if (selectedMsgs.isNotEmpty) {
              if (selectedMsgs.contains(item)) {
                barCtrl.selected.value.remove(item);
              } else {
                barCtrl.selected.value.add(item);
              }

              barCtrl.selected.refresh();
            }
          },
          onLongPress: () {
            if (item == null) return;
            barCtrl.selected.value.add(item);
            barCtrl.selected.refresh();
          },
          borderRadius: bradius,
          child: child,
        );
    return Stack(
      children: [
        // ignore: avoid_unnecessary_containers
        Container(
            decoration: BoxDecoration(
                color: color ?? Tu.colors.bg1, borderRadius: bradius),
            child: inkWell(
              child: Padding(padding: padding, child: child),
            )),
        Obx(
          () => !barCtrl.selected.value.contains(item)
              ? none()
              : Positioned.fill(
                  child: Container(
                  decoration: BoxDecoration(
                      color: barCtrl.selected.value.contains(item)
                          ? Tu.colors.secondaryFade
                          : null,
                      borderRadius: bradius),
                  child: inkWell(),
                )),
        ),
      ],
    );
  }
}
