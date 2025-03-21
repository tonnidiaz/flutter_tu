import "dart:core";
import "package:flutter/material.dart";
import "package:tu/tu.dart";
import 'package:get/get.dart';

class TuSelect extends StatelessWidget {
  final dynamic value;
  final void Function(dynamic)? onChanged;
  final String? label;
  final double? width;
  final double? radius;
  final double elevation;
  final double? height;
  final double? labelFontSize;
  final bool disabled;
  final Color? bgColor;
  final Color? borderColor;
  final List<SelectItem?> items;
  const TuSelect(
      {Key? key,
      this.items = const [],
      this.value,
      this.label = "Dropdown",
      this.width,
      this.height = 40,
      this.radius,
      this.bgColor,
      this.borderColor,
      this.labelFontSize,
      this.elevation = .5,
      this.onChanged,
      this.disabled = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List parseItems() {
      return [...items].where((element) => element != null).toList();
    }

    return Container(
      width: width,
      //height: height,
      margin: const EdgeInsets.symmetric(vertical: 2.5),
      child: Obx(
        () => Material(
          color: /* mFieldBG2, */
              bgColor ?? colors.bgField,
          elevation: elevation,
          shadowColor: Colors.black87,
          borderRadius: BorderRadius.circular(radius ?? 0),
          child: ButtonTheme(
            alignedDropdown: true,
            child: DropdownButtonFormField(
              value: value, // ?? formats[0],
              dropdownColor: bgColor ?? colors.bgField,
              focusColor: bgColor ?? colors.bgField,
              isExpanded: true,
              isDense: true,
              icon: Icon(
                Icons.expand_more_outlined,
                color: colors.onBackground,
              ),
              decoration: InputDecoration(
                label: label == null
                    ? null
                    : Padding(
                        padding: const EdgeInsets.only(left: 22.0),
                        child: Text(label!),
                      ),
              ),
              items: parseItems().map((e) {
                return DropdownMenuItem(
                  value: e.value,
                  child: Text(
                    e.label,
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 16, color: colors.onBackground),
                  ),
                );
              }).toList(),
              onChanged: disabled ? null : onChanged,
            ),
          ),
        ),
      ),
    );
  }
}
