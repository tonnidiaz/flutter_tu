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
          TuCard(
            height: 5,
            width: 35,
            radius: 50,
            color: dark ? Colors.white38 : Colors.black12,
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

class TuIconText extends StatelessWidget {
  final IconData icon;
  final double size;
  final FontWeight? fontWeight;
  final Color? color;
  const TuIconText(this.icon,
      {super.key, this.size = iconSize, this.fontWeight, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      String.fromCharCode(icon.codePoint),
      style: TextStyle(
          inherit: false,
          fontFamily: icon.fontFamily,
          package: icon.fontPackage,
          fontSize: size,
          color: color,
          fontWeight: fontWeight),
    );
  }
}

class TuBottomNavbarItem extends StatelessWidget {
  final IconData? icon;
  final bool isActive;
  final String? label;
  final String? iconName;
  final double icSize;
  final void Function()? onTap;
  const TuBottomNavbarItem(
      {super.key,
      this.icon,
      this.isActive = false,
      this.iconName,
      this.label,
      this.icSize = iconSize,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(100),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            icon.isNotNull
                ? TuIconText(
                    icon!,
                    size: isActive ? icSize + 10 : icSize,
                    color: isActive
                        ? colors.onSurface
                        : colors.onSurface.withOpacity(.8),
                    fontWeight: isActive ? FontWeight.w900 : FontWeight.w600,
                  )
                : svgIcon(
                    name: iconName!,
                    size: isActive ? icSize - 3.5 + 10 : icSize - 3.5,
                    color: isActive
                        ? colors.onSurface
                        : colors.onSurface.withOpacity(.9),
                  ),
            Visibility(
              visible: label.isNotNull,
              child: Container(
                margin: EdgeInsets.only(top: 4),
                child: Text(
                  label ?? "",
                  style: TextStyle(
                    fontWeight: isActive ? FontWeight.w900 : null,
                    fontSize: icSize - 10,
                    color: isActive
                        ? colors.onSurface
                        : colors.onSurface.withOpacity(.9),
                  ),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}

class TuObx extends StatelessWidget {
  final Widget child;
  const TuObx({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Obx(() => child);
  }
}
