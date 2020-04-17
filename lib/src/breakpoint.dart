import 'package:flutter/material.dart';

/// Defines the points to be built by the Widget, using:
/// max width or max height;
/// min width or min height;
/// orientation mode;
/// or both.
class ResponsiveBreakpoint {
  ResponsiveBreakpoint({
    this.maxWidth,
    this.maxHeight,
    this.minWidth,
    this.minHeight,
    this.orientation,
  });

  /// Defines a breakpoint using [minHeight]
  factory ResponsiveBreakpoint.byMinHeight(num minHeight) =>
    ResponsiveBreakpoint(minHeight: minHeight);

  /// Defines a breakpoint using [minWidth]
  factory ResponsiveBreakpoint.byMinWidth(num minWidth) =>
    ResponsiveBreakpoint(minWidth: minWidth);

  /// Defines a breakpoint using [maxHeight]
  factory ResponsiveBreakpoint.byMaxHeight(num maxHeight) =>
    ResponsiveBreakpoint(maxHeight: maxHeight);

  /// Defines a breakpoint using [maxWidth]
  factory ResponsiveBreakpoint.byMaxWidth(num maxWidth) =>
    ResponsiveBreakpoint(maxWidth: maxWidth);

  /// Defines a breakpoint using [orientation] = [Orientation.portrait]
  factory ResponsiveBreakpoint.byPortraitMode() =>
    ResponsiveBreakpoint(orientation: Orientation.portrait);

  /// Defines a breakpoint using [orientation] = [Orientation.landscape]
  factory ResponsiveBreakpoint.byLandscapeMode() =>
    ResponsiveBreakpoint(orientation: Orientation.landscape);

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
