import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:tu/tu.dart';

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
  const TuButton(
      {super.key,
      this.text = "",
      this.width,
      this.height = 45,
      this.vp = 5,
      this.radius = 3,
      this.hp = 10,
      this.outlined = false,
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

    return Obx(() {
      Tu.appCtrl.darkMode;
      final backgroundColor =
          bgColor ?? (dark ? Tu.colors.surface : Colors.black);
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
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    side: BorderSide(
                        color: color ?? Tu.colors.onBackground, width: 1.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(radius),
                    )),
                child: child ??
                    Text(
                      text.toUpperCase(),
                      style: TextStyle(color: color ?? Colors.white),
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
                    backgroundColor:
                        backgroundColor, //const Color.fromRGBO(26, 92, 255, 1),
                    /* shadowColor:
                                Tu.colors.onBackground(), // const Color.fromRGBO(26, 92, 255, .5), */
                    elevation: 2,
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(radius))),
                child: child ??
                    Text(
                      text.toUpperCase(),
                      style: TextStyle(color: color ?? Colors.white),
                    ),
              ),
      );
    });
  }
}
