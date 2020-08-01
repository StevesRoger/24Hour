import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';

import 'widget/circular_progress.dart';

class LoadingPanel extends LoadingOverlay {
  final Widget child;
  final bool isLoading;
  final Color color;

  LoadingPanel(
      {@required this.child, this.isLoading = false, this.color = Colors.black12})
      : super(
          isLoading: isLoading,
          child: child,
          progressIndicator: CircularProgress(),
          color: color,
        );
}
