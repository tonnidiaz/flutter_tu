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
  final Widget child;
  const TuResizableWin({super.key, required this.child});

  @override
  State<TuResizableWin> createState() => _TuResizableWinState();
}

class _TuResizableWinState extends State<TuResizableWin> {
  final double borderSize = 5.0;
  final Color borderColor = Colors.transparent;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.zero,
          child: widget.child,
        ),

        // Top Border
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          height: borderSize,
          child: GestureDetector(
            onTapDown: (_) {
              windowManager.startResizing(ResizeEdge.top);
            },
            child: MouseRegion(
              cursor: SystemMouseCursors.resizeUp,
              child: Container(color: borderColor),
            ),
          ),
        ),

        // Bottom Border
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          height: borderSize,
          child: GestureDetector(
            onTapDown: (_) {
              windowManager.startResizing(ResizeEdge.bottom);
            },
            child: MouseRegion(
              cursor: SystemMouseCursors.resizeDown,
              child: Container(color: borderColor),
            ),
          ),
        ),

        // Left Border
        Positioned(
          top: 0,
          bottom: 0,
          left: 0,
          width: borderSize,
          child: GestureDetector(
            onTapDown: (_) {
              windowManager.startResizing(ResizeEdge.left);
            },
            child: MouseRegion(
              cursor: SystemMouseCursors.resizeLeft,
              child: Container(color: borderColor),
            ),
          ),
        ),

        // Right Border
        Positioned(
          top: 0,
          bottom: 0,
          right: 0,
          width: borderSize,
          child: GestureDetector(
            onTapDown: (_) {
              windowManager.startResizing(ResizeEdge.right);
            },
            child: MouseRegion(
              cursor: SystemMouseCursors.resizeRight,
              child: Container(color: borderColor),
            ),
          ),
        ),

        // Top-Left Corner
        Positioned(
          top: 0,
          left: 0,
          width: borderSize * 2,
          height: borderSize * 2,
          child: GestureDetector(
            onTapDown: (_) {
              windowManager.startResizing(ResizeEdge.topLeft);
            },
            child: MouseRegion(
              cursor: SystemMouseCursors.resizeUpLeft,
              child: Container(color: borderColor),
            ),
          ),
        ),

        // Top-Right Corner
        Positioned(
          top: 0,
          right: 0,
          width: borderSize * 2,
          height: borderSize * 2,
          child: GestureDetector(
            onTapDown: (_) {
              windowManager.startResizing(ResizeEdge.topRight);
            },
            child: MouseRegion(
              cursor: SystemMouseCursors.resizeUpRight,
              child: Container(color: borderColor),
            ),
          ),
        ),

        // Bottom-Left Corner
        Positioned(
          bottom: 0,
          left: 0,
          width: borderSize * 2,
          height: borderSize * 2,
          child: GestureDetector(
            onTapDown: (_) {
              windowManager.startResizing(ResizeEdge.bottomLeft);
            },
            child: MouseRegion(
              cursor: SystemMouseCursors.resizeDownLeft,
              child: Container(color: borderColor),
            ),
          ),
        ),

        // Bottom-Right Corner
        Positioned(
          bottom: 0,
          right: 0,
          width: borderSize * 2,
          height: borderSize * 2,
          child: GestureDetector(
            onTapDown: (_) {
              windowManager.startResizing(ResizeEdge.bottomRight);
            },
            child: MouseRegion(
              cursor: SystemMouseCursors.resizeDownRight,
              child: Container(color: borderColor),
            ),
          ),
        ),
      ],
    );
  }
}
