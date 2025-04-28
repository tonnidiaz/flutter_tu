// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class TuPopupBtn extends StatelessWidget {
  final List<PopupMenuEntry<Object?>?> items;
  final Widget? child;
  final Function()? onOpened;
  final EdgeInsetsGeometry padding;
  const TuPopupBtn(
      {super.key,
      this.items = const [],
      this.onOpened,
      this.padding = const EdgeInsets.all(8.0),
      this.child});

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
        tooltip: "",
        padding: EdgeInsets.zero,
        onOpened: onOpened,
        splashRadius: 5,
        child: child,
        itemBuilder: (context) => parseItems());
  }
}

PopupMenuEntry<Object?> TuPopupMenuItem({
  required final Widget child,
  final void Function()? onTap,
  final bool enabled = true,
}) {
  return PopupMenuItem(
    height: 30,
    onTap: onTap,
    enabled: enabled,
    child: child,
  );
}

class TuMenuAnchor extends StatelessWidget {
  final List<Widget> menuChildren;
  final Widget? child;
  const TuMenuAnchor({super.key, required this.menuChildren, this.child});

  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
        menuChildren: menuChildren,
        builder: (c, ctrl, _) => InkWell(
              onTap: () {
                ctrl.isOpen ? ctrl.close() : ctrl.open();
              },
              child: child ?? const Icon(Icons.more_vert_sharp),
            ));
  }
}
