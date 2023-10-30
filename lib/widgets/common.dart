import 'dart:core';
import 'package:flutter/material.dart';
import 'package:tu/tu.dart';

Widget mY(double h) {
  return SizedBox(height: h);
}

Widget mX(double h) {
  return SizedBox(height: h);
}

Widget h3(String txt) {
  return Text(
    txt,
    style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
  );
}

Widget NavItem({String text = "", void Function()? onClick}) {
  return InkWell(
    onTap: onClick,
    child: Container(
      width: double.infinity,
      //color: const Color.fromRGBO(30, 30, 30, .2),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      margin: const EdgeInsets.symmetric(vertical: 2),
      child: Text(
        text,
        textAlign: TextAlign.left,
        style: const TextStyle(fontSize: 15),
      ),
    ),
  );
}

Widget sizedText(String text,
    {double width = 150, double fs = 16, Color color = Colors.white70}) {
  return SizedBox(
      width: width,
      child: Text(
        text,
        softWrap: false,
        style: TextStyle(
          fontSize: fs,
          overflow: TextOverflow.fade,
          color: color,
        ),
      ));
}

class TDropdownButton extends StatelessWidget {
  Object? value;
  void Function(Object?)? onChanged;
  String? label = "Dropdown";
  Function(Object)? itemLabel;
  double? width;
  bool disabled;
  List<Object>? items = [];
  TDropdownButton(
      {Key? key,
      this.items,
      this.value,
      this.label,
      this.width,
      this.onChanged,
      this.itemLabel,
      this.disabled = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    width ??= screenSize(context).width;
    return Container(
      width: width,
      height: 45,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      margin: const EdgeInsets.symmetric(vertical: 2.5),
      decoration: BoxDecoration(
          color: TuColors.btnBG,
          border: Border.all(color: TuColors.titlebarBG, width: 2),
          borderRadius: BorderRadius.circular(10)),
      child: DropdownButton(
          value: value, // ?? formats[0],
          dropdownColor: TuColors.btnBG,
          underline: Container(),
          isExpanded: true,
          borderRadius: BorderRadius.circular(5),
          hint: SizedBox(child: Text("$label")),
          items: items!.map((e) {
            return DropdownMenuItem(
              value: e.toString().toLowerCase(),
              child: Text(itemLabel != null
                  ? itemLabel!(e)
                  : e.toString().toUpperCase()),
            );
          }).toList(),
          onChanged: disabled ? null : onChanged),
    );
  }
}

Widget iconText(String text, IconData icon,
    {double spacing = 4.0,
    double iconSize = 18,
    double? fontSize,
    Function()? onClick}) {
  final child = Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Icon(
        icon,
        size: iconSize,
      ),
      mX(spacing),
      Text(
        text,
        style: TextStyle(fontSize: fontSize),
      )
    ],
  );

  return onClick != null
      ? InkWell(onTap: onClick, enableFeedback: true, child: child)
      : child;
}

Widget none() {
  return const SizedBox(
    width: 0,
    height: 0,
  );
}
