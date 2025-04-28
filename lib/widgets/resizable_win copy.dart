import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../tu.dart';

class Ctrl extends GetxController {
  final _isMaximized = Rx<bool>(false);
  bool get isMaximized => _isMaximized.value;
  set isMaximized(bool val) => _isMaximized.value = val;

  final _isFullscreen = Rx<bool>(false);
  bool get isFullscreen => _isFullscreen.value;
  set isFullscreen(bool val) => _isFullscreen.value = val;
  Rx<bool> get isFullScreenStream => _isFullscreen;

  final _leading = Rx<List<Widget>>([]);
  List<Widget> get leading => _leading.value;
  set leading(List<Widget> val) => _leading.value = val;

  final _trailing = Rx<List<Widget>>([]);
  List<Widget> get trailing => _trailing.value;
  set trailing(List<Widget> val) => _trailing.value = val;
}

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
  final Widget? title;
  final Widget? logoIcon;
  final List<Widget>? leading;
  final List<Widget>? trailing;

  const TuResizableWin(
      {super.key,
      required this.child,
      this.title,
      this.logoIcon,
      this.leading,
      this.trailing});

  static final Ctrl ctrl = Get.put(Ctrl());
  @override
  State<TuResizableWin> createState() => _TuResizableWinState();
}

class _TuResizableWinState extends State<TuResizableWin> with WindowListener {
  final double borderSize = 5.5;
  final Color borderColor = Colors.transparent;
  final ctrl = TuResizableWin.ctrl;

  @override
  void initState() {
    super.initState();
    windowManager.addListener(this);
  }

  @override
  void onWindowMaximize() {
    super.onWindowMaximize();
    ctrl.isMaximized = true;
  }

  @override
  void onWindowUnmaximize() {
    super.onWindowUnmaximize();
    ctrl.isMaximized = false;
  }

  @override
  void onWindowEnterFullScreen() {
    super.onWindowEnterFullScreen();
    ctrl.isFullscreen = true;
  }

  @override
  void onWindowLeaveFullScreen() {
    super.onWindowLeaveFullScreen();
    ctrl.isFullscreen = false;
  }

  @override
  void dispose() {
    windowManager.removeListener(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
            appBar: AppBar(
              titleSpacing: 0,
              title: GestureDetector(
                onSecondaryTapUp: (ev) {
                  windowManager.popUpWindowMenu();
                },
                onDoubleTap: () {
                  windowManager.maximize();
                },
                child: Container(
                  height: appBarH,
                  width: double.infinity,
                  color: Colors.transparent,
                  child: TuFlex(
                    children: [
                      // Leading
                      TuFlex(
                        gap: 0,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if (widget.logoIcon != null) ...[
                            mX(8),
                            widget.logoIcon!
                          ],
                          ...(widget.leading ?? []),
                        ],
                      ),
                      //   Title
                      Expanded(
                          child: Listener(
                        onPointerDown: (e) {
                          if (e.buttons == kPrimaryMouseButton) {
                            windowManager.startDragging();
                          }
                        },
                        child: Container(
                            color: Colors.transparent,
                            child: Center(child: widget.title)),
                      )),
                      //   Actions
                      TuFlex(
                        gap: 0,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ...(widget.trailing ?? []),
                          IconButton(
                            // padding: EdgeInsets.zero,

                            onPressed: () {
                              windowManager.minimize();
                            },
                            icon: const Icon(Icons.minimize_outlined),
                            iconSize: 14,
                          ),
                          IconButton(
                            // padding: EdgeInsets.zero,

                            onPressed: () {
                              if (ctrl.isMaximized) {
                                windowManager.unmaximize();
                              } else {
                                windowManager.maximize();
                              }
                            },
                            icon: Obx(
                              () => Icon(ctrl.isMaximized
                                  ? Icons.filter_none
                                  : Icons.crop_square),
                            ),
                            iconSize: 14,
                          ),
                          IconButton(
                            // padding: EdgeInsets.zero,

                            onPressed: () {
                              windowManager.close();
                            },
                            icon: const Icon(Icons.close_outlined),
                            iconSize: 16,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              //   hasBg: true,
              centerTitle: true,
            ),
            body: Padding(
              padding: EdgeInsets.zero,
              child: widget.child,
            )),

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
