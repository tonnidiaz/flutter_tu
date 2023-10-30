import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../utils/index.dart';

class TuButton extends HookWidget {
  final double? width;
  final double height;
  final double vp;
  final double radius;
  final double hp;
  final Function()? onPressed;
  final Color? bgColor;
  final Color? color;
  final Widget? child;
  final String text;
  final bool outlined;
  final bool darkMode;
  const TuButton(
      {super.key,
      this.text = "",
      this.width,
      this.height = 45,
      this.vp = 5,
      this.radius = 3,
      this.hp = 10,
      this.outlined = false,
      this.darkMode = true,
      this.onPressed,
      this.bgColor,
      this.color,
      this.child});

  @override
  Widget build(BuildContext context) {
    final isProcessing = useState(false);
    setIsProcessing(bool val) {
      isProcessing.value = val;
    }

    return SizedBox(
      width: width,
      height: height,
      child: outlined
          ? OutlinedButton(
              onPressed: isProcessing.value
                  ? null
                  : () async {
                      setIsProcessing(true);
                      if (onPressed != null) {
                        await onPressed!();
                      }
                      setIsProcessing(false);
                    },
              style: OutlinedButton.styleFrom(
                  alignment: Alignment.center,

                  /*   shadowColor: TuColors
                        .coffee1Shadow, // const Color.fromRGBO(26, 92, 255, .5),
                    elevation: 1.5, */
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  side: BorderSide(
                      color: color ?? TuColors.text(dark: darkMode),
                      width: 1.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(radius),
                  )),
              child: child ??
                  Text(
                    text.toUpperCase(),
                    style: TextStyle(color: color ?? TuColors.text(dark: true)),
                  ),
            )
          : ElevatedButton(
              onPressed: isProcessing.value || onPressed == null
                  ? null
                  : () async {
                      setIsProcessing(true);
                      if (onPressed != null) {
                        await onPressed!();
                      }
                      setIsProcessing(false);
                    },
              style: ElevatedButton.styleFrom(
                  alignment: Alignment.center,
                  disabledBackgroundColor: TuColors.medium,
                  disabledForegroundColor: Colors.white,
                  backgroundColor: bgColor ??
                      TuColors.btnBG, //const Color.fromRGBO(26, 92, 255, 1),
                  /* shadowColor:
                        TuColors.text(), // const Color.fromRGBO(26, 92, 255, .5), */
                  elevation: 1.5,
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(radius))),
              child: child ??
                  Text(
                    text.toUpperCase(),
                    style:
                        TextStyle(color: color ?? TuColors.text2(dark: true)),
                  ),
            ),
    );
  }
}
