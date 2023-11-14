
import 'package:flutter/material.dart';

import '../tu.dart';

class InfoItem extends StatelessWidget {
  final Function()? onTap;
  final Widget? child;
  const InfoItem({super.key, this.onTap, this.child});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap, 
      child: Container(
          width: double.infinity,
          height: 50,
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          margin: const EdgeInsets.symmetric(vertical: .5),
          decoration:  BoxDecoration(
              color: TuColors.bg1(),
              border: const Border(
                  bottom: BorderSide(
                      color: Color.fromRGBO(10, 10, 10, 0.05), width: 1))),
          child: child),
    );
  }
}


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
