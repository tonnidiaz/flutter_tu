import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../utils/classes.dart';

Page<dynamic> _buildPage(Widget child) {
  return CustomTransitionPage(
    child: child,
    transitionDuration: Duration.zero,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );
}

/// Generates a go router to be used in MaterialApp.routerConfig
GoRouter genGoRouter(
    {required final List<TuRoute> routes,
    required Widget Function(
            BuildContext ctx, GoRouterState state, Widget child)
        layoutBuilder}) {
  return GoRouter(routes: [
    ShellRoute(builder: layoutBuilder, routes: [
      ...routes.map((route) => GoRoute(
            path: route.name,
            pageBuilder: (context, state) => _buildPage(route.child),
          ))
    ])
  ]);
}
