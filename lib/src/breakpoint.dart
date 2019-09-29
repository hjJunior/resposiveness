import 'package:flutter/material.dart';

/// A callback used when the breakpoint matches with the current size
typedef ResponsiveBuilderCallback = Widget Function(
  BuildContext context,
  BoxConstraints constraints,
  List<Widget> children,
);

/// Defines the min and max of width and height to be used the widget builder
class ResponsiveBreakpoint {
  ResponsiveBreakpoint({
    @required
    this.builder,
    this.maxWidth,
    this.maxHeight,
    this.minWidth,
    this.minHeight,
  }) : assert(builder != null);

  /// Defines a breakpoint using [minHeight]
  factory ResponsiveBreakpoint
    .byMinHeight({
      @required
      ResponsiveBuilderCallback builder,
      num minHeight,
    }) => ResponsiveBreakpoint(minHeight: minHeight, builder: builder);

  /// Defines a breakpoint using [minWidth]
  factory ResponsiveBreakpoint
    .byMinWidth({
      @required
      ResponsiveBuilderCallback builder,
      num minWidth,
    }) => ResponsiveBreakpoint(minWidth: minWidth, builder: builder);

  /// Defines a breakpoint using [maxHeight]
  factory ResponsiveBreakpoint
    .byMaxHeight({
      @required
      ResponsiveBuilderCallback builder,
      num maxHeight,
    }) => ResponsiveBreakpoint(maxHeight: maxHeight, builder: builder);

  /// Defines a breakpoint using [maxWidth]
  factory ResponsiveBreakpoint
    .byMaxWidth({
      @required
      ResponsiveBuilderCallback builder,
      num maxWidth,
    }) => ResponsiveBreakpoint(maxWidth: maxWidth, builder: builder);

  final num maxWidth;
  final num maxHeight;
  final num minWidth;
  final num minHeight;
  final ResponsiveBuilderCallback builder;

  /// Useful when you wants use this class independently of ResponsiveBuilder
  bool hasMatchWithSize(Size size) =>
    size.height >= (minHeight ?? size.height) &&
    size.width >= (minWidth ?? size.width) &&
    size.height <= (maxHeight ?? size.height) &&
    size.width <= (maxWidth ?? size.width);
}
