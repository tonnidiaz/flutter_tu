import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tu/utils/classes.dart';

import '../utils/index.dart';

Widget mY(double h) {
  return SizedBox(height: h);
}

Widget mX(double w) {
  return SizedBox(width: w);
}

class NavItem extends StatelessWidget {
  final String text;
  final Function()? onClick;
  const NavItem({super.key, this.text = "", this.onClick});

  @override
  Widget build(BuildContext context) {
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

Widget tuColumn(
    {List<Widget> children = const [], bool min = false, bool center = true}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: min ? MainAxisSize.min : MainAxisSize.max,
    mainAxisAlignment:
        center ? MainAxisAlignment.center : MainAxisAlignment.start,
    children: children,
  );
}

Widget tuRow({List<Widget> children = const [], bool min = false}) {
  return Row(
    mainAxisSize: min ? MainAxisSize.min : MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: children,
  );
}

class InfoItem extends StatelessWidget {
  final Function()? onTap;
  final Widget? child;
  final bool darkMode;
  const InfoItem({super.key, this.onTap, this.child, this.darkMode = true});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Obx(
        () => Container(
            width: double.infinity,
            height: 55,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            margin: const EdgeInsets.symmetric(vertical: .5),
            decoration: BoxDecoration(
                color: Tu.colors.bg1,
                border: const Border(
                    bottom: BorderSide(
                        color: Color.fromRGBO(10, 10, 10, 0.05), width: 1))),
            child: child),
      ),
    );
  }
}

Widget devider({Color? color}) =>
    Container(height: 1, color: color ?? Colors.black12);
Widget svgIcon(
        {required String name,
        Color? color,
        double size = 20,
        double? width,
        double? height}) =>
    SvgPicture.asset(
      "assets/icons/$name.svg",
      color: color,
      semanticsLabel: "icon",
      width: width ?? size,
      height: height ?? size,
      colorBlendMode: BlendMode.srcIn,
    );

class TuScrollview extends StatelessWidget {
  final Widget? child;
  const TuScrollview({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: child,
    );
  }
}

class ProgressSheet extends StatefulWidget {
  final Color? color;
  final String? msg;
  final bool dismissable;
  final Function()? onDismiss;
  const ProgressSheet(
      {super.key,
      this.color,
      this.msg,
      required this.dismissable,
      this.onDismiss});

  @override
  State<ProgressSheet> createState() => _ProgressSheetState();
}

class _ProgressSheetState extends State<ProgressSheet> {
  final _ctrl = Tu.progressCtrl;

  @override
  void dispose() {
    backEnabled = true;
    progressSheets.removeLast();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _ctrl.setProgress(null);
    });
    if (widget.onDismiss != null) {
      widget.onDismiss!();
    }

    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    progressSheets.add(DateTime.now());
    if (!widget.dismissable) {
      backEnabled = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
        child: Container(
            height: 45,
            color: widget.color ?? Tu.colors.bg,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(() => LinearProgressIndicator(
                      value: _ctrl.progress.value,
                      color: Tu.colors.primaryFade,
                    )),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Text(widget.msg ?? "Hang on...")],
                    ),
                  ),
                )
              ],
            )));
  }
}

class TuCard extends StatelessWidget {
  final double radius;
  final double padding;
  final double my;
  final double? mb;
  final double? mr;
  final double? ml;
  final double? mt;
  final double borderSize;
  final double mx;
  final Widget? child;
  final Function()? onTap;
  final Function()? onLongPress;
  final double? width;
  final double? height;
  final Color? color;
  final double elevation;
  const TuCard(
      {super.key,
      this.radius = 0,
      this.padding = 8,
      this.my = 0,
      this.mx = 0,
      this.ml,
      this.mr,
      this.mt,
      this.mb,
      this.borderSize = 1.6,
      this.child,
      this.onTap,
      this.onLongPress,
      this.height,
      this.color,
      this.elevation = .3,
      this.width = double.infinity});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(ml ?? mx, mt ?? my, mr ?? mx, mb ?? my),
      height: height,
      width: width,
      child: Material(
        color: color ?? Tu.colors.bg1,
        borderRadius: BorderRadius.circular(radius),
        elevation: elevation,
        child: InkWell(
          onTap: onTap,
          onLongPress: onLongPress,
          borderRadius: BorderRadius.circular(radius),
          child: Padding(
            padding: EdgeInsets.all(padding),
            child: child,
          ),
        ),
      ),
    );
  }
}

class TuSliver extends StatelessWidget {
  final Widget? child;
  const TuSliver({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: child,
    );
  }
}
