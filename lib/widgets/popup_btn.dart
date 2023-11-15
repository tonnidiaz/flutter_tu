import 'package:flutter/material.dart';

class TuPopupBtn extends StatelessWidget {
  final List<PopupMenuEntry<Object?>?> items;
  final Function()? onOpened;
  final EdgeInsetsGeometry padding;
  const TuPopupBtn(
      {super.key,
      this.items = const [],
      this.onOpened,
      this.padding = const EdgeInsets.all(8.0)});

  List<PopupMenuEntry<Object?>> parseItems() {
    List<PopupMenuEntry<Object?>> its = [];
    for (var it in items.where((element) => element != null).toList()) {
      its.add(it!);
    }
    return its;
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        padding: padding,
        onOpened: onOpened,
        splashRadius: 20,
        itemBuilder: (context) => parseItems());
  }
}
