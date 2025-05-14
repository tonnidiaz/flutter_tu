import 'package:flutter/material.dart';

class TuSliderTheme extends StatelessWidget {
  final Widget child;
  final double? trackHeight;
  final double thumbRadius;
  const TuSliderTheme(
      {super.key,
      required this.child,
      this.trackHeight,
      this.thumbRadius = 10});

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        trackHeight: trackHeight, // Makes track smaller
        thumbShape: RoundSliderThumbShape(
            enabledThumbRadius: thumbRadius), // Custom thumb
        overlayShape:
            SliderComponentShape.noOverlay, // Removes extra hover area
      ),
      child: child,
    );
  }
}

class TuImage extends StatefulWidget {
  final Widget? child;
  const TuImage({super.key, this.child});

  @override
  State<TuImage> createState() => _TuImageState();
}

class _TuImageState extends State<TuImage> {
  double _scale = 1.0;
  final double _zoomScale = 2.5;
  Offset _offset = Offset.zero;
  Offset _normalizedOffset = Offset.zero;
  bool _isZoomed = false;

  void _handleDoubleTap(TapDownDetails details) {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final Offset tapPosition = renderBox.globalToLocal(details.globalPosition);

    setState(() {
      if (_isZoomed) {
        // Zoom out
        _scale = 1.0;
        _offset = Offset.zero;
      } else {
        // Zoom in centered at tap
        _scale = _zoomScale;
        _offset = Offset(
          -(tapPosition.dx * (_zoomScale - 1)),
          -(tapPosition.dy * (_zoomScale - 1)),
        );
      }
      _isZoomed = !_isZoomed;
    });
  }

  void _handlePanUpdate(DragUpdateDetails details) {
    if (_isZoomed) {
      setState(() {
        _offset += details.delta;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTapDown: _handleDoubleTap,
      onPanUpdate: _handlePanUpdate,
      child: Container(
        color: Colors.blue,
        padding: EdgeInsets.all(8),
        child: Center(
          child: ClipRect(
            child: Transform(
              transform: Matrix4.identity()
                ..translate(_offset.dx, _offset.dy)
                ..scale(_scale),
              child: widget.child, // or Image.network()
            ),
          ),
        ),
      ),
    );
  }
}
