library modal_progress_hud;

import 'package:flutter/material.dart';

///
/// Wrap around any widget that makes an async call to show a modal progress
/// indicator while the async call is in progress.
///
/// The progress indicator can be turned on or off using [inAsyncCall]
///
/// The progress indicator defaults to a [CircularProgressIndicator] but can be
/// any kind of widget
///
/// The progress indicator can be positioned using [offset] otherwise it is
/// centered
///
/// The modal barrier can be dismissed using [dismissible]
///
/// The color of the modal barrier can be set using [color]
///
/// The opacity of the modal barrier can be set using [opacity]
///
/// HUD=Heads Up Display
///
class ProgressHUD extends StatelessWidget {
  final bool inAsyncCall;
  final double opacity;
  final Color color;
  final Widget progressIndicator;
  final Offset offset;
  final bool dismissible;
  final Widget child;

  const ProgressHUD({
    super.key,
    required this.inAsyncCall,
    this.opacity = 0.4,
    this.color = Colors.grey,
    this.progressIndicator = const CircularProgressIndicator(),
    this.offset = const Offset(0, 0),
    this.dismissible = false,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    if (!inAsyncCall) return child;
    Widget layOutProgressIndicator;
    if (offset.dx == 0) {
      layOutProgressIndicator = Center(child: progressIndicator);
    } else {
      layOutProgressIndicator = Positioned(
        left: offset.dx,
        top: offset.dy,
        child: progressIndicator,
      );
    }
    return Stack(
      children: [
        child,
        Container(
          color: const Color.fromARGB(255, 1, 1, 1).withOpacity(opacity),
        ),
        layOutProgressIndicator,
      ],
    );
  }
}
