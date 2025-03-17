import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:tu/tu.dart';

class TuButton extends HookWidget {
  final double? width;
  final double height;

  ///Vertical padding
  final double vp;

  ///Border radius
  final double radius;

  ///Horizontal padding
  final double hp;
  final Function()? onPressed;
  final Color? bgColor;
  final Color? color;
  final Widget? child;
  final String text;
  final bool outlined;
  final Size? size;
  const TuButton(
      {super.key,
      this.text = "",
      this.size,
      this.width,
      this.height = 38,
      this.vp = 5,
      this.radius = 8,
      this.hp = 2,
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
          bgColor ?? (dark ? Colors.black.withOpacity(.5) : Colors.black);
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
                    // fixedSize: size ?? Size(double.infinity, 45),
                    backgroundColor: bgColor ?? colors.color_blue_700,
                    alignment: Alignment.center,
                    elevation: 1.5,
                    padding: EdgeInsets.symmetric(vertical: vp, horizontal: hp),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(radius))),
                child: child ??
                    Text(
                      text,
                      style: TextStyle(color: color ?? Colors.white),
                    ),
              ),
      );
    });
  }
}
