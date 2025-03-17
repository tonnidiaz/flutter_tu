import 'package:flutter/material.dart';

class TuSliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double height;
  final Widget child;

  const TuSliverAppBarDelegate({required this.height, required this.child});
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
