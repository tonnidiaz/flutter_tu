import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tu/tu.dart';

class TuLabeledCheckbox extends StatelessWidget {
  final bool value;
  final double radius;
  final Function(bool?) onChanged;
  final String? label;
  final Position labelPos;
  final Color? activeColor;
  final FontWeight? fontWeight;
  const TuLabeledCheckbox(
      {super.key,
      this.fontWeight = FontWeight.w500,
      this.label,
      this.activeColor,
      this.value = false,
      this.radius = 5,
      this.labelPos = Position.right,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final check = Container(
      margin: const EdgeInsets.symmetric(horizontal: 2),
      width: 25,
      child: Checkbox(
          value: value,
          activeColor: activeColor ?? TuColors.primary,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius)),
          onChanged: onChanged),
    );
    final lbl = label != null
        ? Obx(
            () => Text(
              label!,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: fontWeight,
                  color: TuColors.text2(dark: Tu.appCtrl.darkMode.value)),
            ),
          )
        : none();
    return labelPos == Position.right
        ? Row(
            mainAxisSize: MainAxisSize.min,
            children: [check, lbl],
          )
        : labelPos == Position.bottom
            ? Column(
                children: [check, lbl],
              )
            : Column(
                children: [lbl, check],
              );
  }
}