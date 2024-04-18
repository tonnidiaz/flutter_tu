import 'package:flutter/material.dart';

import '../tu.dart';

Widget bulletItem(String text, {TextStyle? style}) => Row(children: [
      const Text(
        "\u2022",
        style: TextStyle(fontSize: 30),
      ), //bullet text
      const SizedBox(
        width: 10,
      ), //space between bullet and text
      Expanded(
        child: Text(
          text,
          style: style,
        ), //text
      )
    ]);

Widget tuTableRow(Widget? first, Widget? last,
    {double my = 2, WrapCrossAlignment? crossAxisAlignment}) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: my),
    width: double.infinity,
    child: Wrap(
      alignment: WrapAlignment.spaceBetween,
      runAlignment: WrapAlignment.spaceBetween,
      crossAxisAlignment: crossAxisAlignment ?? WrapCrossAlignment.center,
      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [first ?? none(), last ?? none()],
    ),
  );
}

class TuBottomSheet extends StatelessWidget {
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final double? elevation;
  const TuBottomSheet({super.key, this.child, this.padding, this.elevation});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: colors.surface,
      elevation: elevation ?? 0,
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const TuCard(
            height: 5,
            width: 35,
            radius: 50,
            color: Colors.black12,
            my: 10,
          ),
          Flexible(
            child: SingleChildScrollView(
              child: Container(
                  padding: padding ?? const EdgeInsets.fromLTRB(14, 0, 14, 14),
                  child: child ?? none()),
            ),
          ),
        ],
      ),
    );
  }
}

Widget cont({Color? color, String text = "", Widget? child}) => Container(
      height: 100,
      width: 100,
      color: color ?? Colors.red,
      margin: defaultPadding,
      child: Center(child: child ?? Text(text)),
    );
