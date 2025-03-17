import 'package:flutter/cupertino.dart';
import 'package:tu/widgets/common.dart';

class TuFlex extends StatelessWidget {
  final List<Widget> children;
  final double gap;
  final bool col;
  final MainAxisSize mainAxisSize;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  const TuFlex({
    super.key,
    required this.children,
    this.gap = 4,
    this.col = false,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  });

  @override
  Widget build(BuildContext context) {
    return children.isEmpty
        ? none()
        : Flex(
            mainAxisAlignment: mainAxisAlignment,
            mainAxisSize: mainAxisSize,
            crossAxisAlignment: crossAxisAlignment,
            direction: col ? Axis.vertical : Axis.horizontal,
            children: List.generate(children.length * 2 - 1, (index) {
              if (index.isEven) {
                return children[index ~/ 2]; // Actual item
              } else {
                return !col ? mX(gap) : mY(gap); // Gap
              }
            }),
          );
  }
}
