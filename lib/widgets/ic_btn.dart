import 'package:flutter/material.dart';

class TuIconBtn extends StatelessWidget {
  final double size;
  final double radius;
  final double elevation;
  final Widget icon;
  final Function()? onPressed;
  const TuIconBtn(
      {super.key,
      this.size = 50,
      required this.icon,
      this.onPressed,
      this.radius = 100,
      this.elevation = 0});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
      child: SizedBox(
        width: size,
        height: size,
        child: IconButton(
            padding: EdgeInsets.zero,
            splashRadius: size / 2,
            onPressed: onPressed,
            icon: icon),
      ),
    );
  }
}
