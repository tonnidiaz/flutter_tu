import 'package:flutter/material.dart';
import 'package:tu/tu.dart';
import 'package:get/get.dart';

class TuLabeledCheckbox extends StatelessWidget {
  final bool value;
  final double radius;
  final Function(bool?) onChanged;
  final String? label;
  final TuPosition labelPos;
  final Color? activeColor;
  final FontWeight? fontWeight;
  const TuLabeledCheckbox(
      {super.key,
      this.fontWeight = FontWeight.w500,
      this.label,
      this.activeColor,
      this.value = false,
      this.radius = 5,
      this.labelPos = TuPosition.right,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final check = Container(
      margin: const EdgeInsets.symmetric(horizontal: 2),
      width: 25,
      child: Checkbox(
          value: value,
          activeColor: activeColor,
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
                  color: Tu.colors.onSurface),
            ),
          )
        : none();
    return labelPos == TuPosition.right
        ? Row(
            mainAxisSize: MainAxisSize.min,
            children: [check, lbl],
          )
        : labelPos == TuPosition.bottom
            ? Column(
                children: [check, lbl],
              )
            : Column(
                children: [lbl, check],
              );
  }
}
