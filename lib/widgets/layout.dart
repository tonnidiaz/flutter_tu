import 'package:flutter/material.dart';

/// builder: passes a GoRouterState to the parent
class TuLayout extends StatelessWidget {
  final Widget Function() builder;
  const TuLayout({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
