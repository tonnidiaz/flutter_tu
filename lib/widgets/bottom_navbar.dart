import 'package:flutter/material.dart';
import '../tu.dart';

class TuBottomNavbar extends StatelessWidget {
  final List<TuPage> routes;
  final int currentIndex;
  final double icSize;
  final void Function(int index) onTap;
  const TuBottomNavbar(
      {super.key,
      this.routes = const [],
      this.currentIndex = 0,
      this.icSize = 25,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        height: bottomBarH,
        margin: const EdgeInsets.fromLTRB(14, 0, 14, 14),
        padding: defaultPadding,
        decoration: BoxDecoration(
            color: colors.surface, borderRadius: BorderRadius.circular(100)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: routes
              .asMap()
              .entries
              .map(
                (e) => TuBottomNavbarItem(
                  icon: e.value.icon,
                  iconName: e.value.svg,
                  isActive: currentIndex == e.key,
                  icSize: icSize,
                  onTap: () {
                    onTap(e.key);
                  },
                  label: e.value.label,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
