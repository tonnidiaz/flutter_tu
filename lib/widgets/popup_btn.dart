import 'package:flutter/material.dart';

class TuPopupBtn extends StatelessWidget {
  final List<PopupMenuEntry<Object?>?> items;
  final Function()? onOpened;
  const TuPopupBtn({super.key, this.items = const [], this.onOpened});

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
        onOpened: onOpened,
        splashRadius: 20,
        itemBuilder: (context) => parseItems());
  }
}
