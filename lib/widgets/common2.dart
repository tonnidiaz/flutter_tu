
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
