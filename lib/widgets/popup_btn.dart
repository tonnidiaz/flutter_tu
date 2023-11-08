import 'package:flutter/material.dart';

class TuPopupBtn extends StatelessWidget {
  final List<PopupMenuEntry<Object?>?> items;
  const TuPopupBtn({super.key, this.items = const []});

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
        splashRadius: 20, itemBuilder: (context) => parseItems());
  }
}
