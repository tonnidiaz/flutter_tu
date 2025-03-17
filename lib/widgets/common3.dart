import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tu/functions.dart';
import 'package:window_manager/window_manager.dart';

class TuResizeBorder extends StatefulWidget {
  final double height;
  final double width;
  final SystemMouseCursor cursor;
  final ResizeEdge resizeEdge;
  const TuResizeBorder(
      {super.key,
      required this.height,
      required this.width,
      required this.cursor,
      required this.resizeEdge});

  @override
  State<TuResizeBorder> createState() => _TuResizeBorderState();
}

class _TuResizeBorderState extends State<TuResizeBorder> {
  bool mouseDown = false;
  @override
  Widget build(BuildContext context) {
    return Container(
        // #bottom-resizer
        width: widget.width,
        height: widget.height,
        color: Colors.black,
        child: Listener(onPointerHover: (ev) {
          clog("[on_hover] ${ev.position}");
        }, child: InkWell(
          onTapDown: (_) {
            windowManager.startResizing(widget.resizeEdge);
          },
        )));
  }
}

class TuResizableWin extends StatefulWidget {
  const TuResizableWin({super.key});

  @override
  State<TuResizableWin> createState() => _TuResizableWinState();
}

class _TuResizableWinState extends State<TuResizableWin> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TuResizeBorder(
          height: 4,
          // #top-resizer
          width: double.infinity,
          resizeEdge: ResizeEdge.top,
          cursor: SystemMouseCursors.resizeUp,
        ),
        Flexible(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TuResizeBorder(
              // #left-resizer
              width: 4,
              height: double.infinity,
              resizeEdge: ResizeEdge.left,
              cursor: SystemMouseCursors.resizeLeft,
            ),
            TuResizeBorder(
              // #right-resizer
              width: 4,
              height: double.infinity,
              resizeEdge: ResizeEdge.right,
              cursor: SystemMouseCursors.resizeRight,
            ),
          ],
        )),
        TuResizeBorder(
          height: 4,
          // #bottom-resizer
          width: double.infinity,
          resizeEdge: ResizeEdge.bottom,
          cursor: SystemMouseCursors.resizeDown,
        ),
        // Scaffold(
        //     appBar: AppBar(
        //   title: const Text("Tu app"),
        // )),
      ],
    );
  }
}
