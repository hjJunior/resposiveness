import 'package:flutter/material.dart';

/// Defines the points to be built by the Widget, using:
/// max width or max height;
/// min width or min height;
/// orientation mode;
/// or both.
class ResposivenessBreakpoint {
  ResposivenessBreakpoint({
    this.maxWidth,
    this.maxHeight,
    this.minWidth,
    this.minHeight,
    this.orientation,
  });

  /// Defines a breakpoint using [minHeight]
  factory ResposivenessBreakpoint.byMinHeight(num minHeight) =>
    ResposivenessBreakpoint(minHeight: minHeight);

  /// Defines a breakpoint using [minWidth]
  factory ResposivenessBreakpoint.byMinWidth(num minWidth) =>
    ResposivenessBreakpoint(minWidth: minWidth);

  /// Defines a breakpoint using [maxHeight]
  factory ResposivenessBreakpoint.byMaxHeight(num maxHeight) =>
    ResposivenessBreakpoint(maxHeight: maxHeight);

  /// Defines a breakpoint using [maxWidth]
  factory ResposivenessBreakpoint.byMaxWidth(num maxWidth) =>
    ResposivenessBreakpoint(maxWidth: maxWidth);

  /// Defines a breakpoint using [orientation] = [Orientation.portrait]
  factory ResposivenessBreakpoint.byPortraitMode() =>
    ResposivenessBreakpoint(orientation: Orientation.portrait);

  /// Defines a breakpoint using [orientation] = [Orientation.landscape]
  factory ResposivenessBreakpoint.byLandscapeMode() =>
    ResposivenessBreakpoint(orientation: Orientation.landscape);

  final num maxWidth;
  final num maxHeight;
  final num minWidth;
  final num minHeight;
  final Orientation orientation;

  /// Useful when you want to use this class independently of ResponsiveBuilder
  bool itMatchesWith({Size size, Orientation currentOrientation}) =>
    size.height >= (minHeight ?? size.height) &&
    size.width >= (minWidth ?? size.width) &&
    size.height <= (maxHeight ?? size.height) &&
    size.width <= (maxWidth ?? size.width) &&
    currentOrientation == (orientation ?? currentOrientation);
}
