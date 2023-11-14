import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tu/tu.dart';

class TuSelectable extends StatelessWidget {
  final dynamic item;
  final Widget child;
  final Function()? onTap;

  /// The item's background color
  final Color? color;

  /// BorderRadius value
  final double radius;
  const TuSelectable(
      {super.key,
      required this.item,
      required this.child,
      this.onTap,
      this.radius = 4,
      this.color});

  @override
  Widget build(BuildContext context) {
    final BarCtrl barCtrl = Get.find();
    final bradius = BorderRadius.circular(radius);

    InkWell inkWell({Widget? child}) => InkWell(
          onTap: () {
            var selectedItems = barCtrl.selected.value;
            if (selectedItems.isNotEmpty) {
              if (selectedItems.contains(item)) {
                barCtrl.selected.value.remove(item);
              } else {
                barCtrl.selected.value.add(item);
              }

              barCtrl.selected.refresh();
            } else {
              if (onTap != null) {
                onTap!();
              }
            }
          },
          onLongPress: () {
            barCtrl.selected.value.add(item);
            barCtrl.selected.refresh();
          },
          borderRadius: bradius,
          child: child,
        );
    return Stack(
      children: [
        Container(
            decoration: BoxDecoration(
                color: color ?? TuColors.bg1(), borderRadius: bradius),
            child: inkWell(child: child)),
        Obx(
          () => !barCtrl.selected.value.contains(item)
              ? none()
              : Positioned.fill(
                  child: Container(
                  decoration: BoxDecoration(
                      color: barCtrl.selected.value.contains(item)
                          ? TuColors.secondaryFade
                          : null,
                      borderRadius: bradius),
                  child: inkWell(),
                )),
        ),
      ],
    );
  }
}