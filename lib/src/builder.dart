import 'package:flutter/material.dart';
import 'package:responsive_builder/src/breakpoint.dart';

/// A callback used when the breakpoint matches with the current size
typedef ResponsiveBuilderCallback = Widget Function(
  BuildContext context,
  List<Widget> children,
);

/// A widget that renders according with the breakpoint list
class ResponsiveBuilder extends StatelessWidget {
  ResponsiveBuilder({
    @required
    this.breakpoints,
    @required
    this.builders,
    this.children,
    this.defaultBreakpoint,
  })
    : assert(breakpoints.isNotEmpty),
      assert(builders.isNotEmpty),
      assert(builders.length == breakpoints.length);

  /// Define a list of [ResponsiveBreakpoint] which defines when should display a new layout
  final List<ResponsiveBreakpoint> breakpoints;

  /// (Optional) define a default breakpoint, if it's not setted, it will be used primarily on breakpoints
  final ResponsiveBreakpoint defaultBreakpoint;

  /// (Optional) a list of children to be passed to the builder method
  /// If possible, use it instead of create all render tree on builder
  final List<Widget> children;

  /// The builder, responsible to render the Widgets according to the breakpoints
  /// (The [builders] list must have the same size of the [breakpoints] list)
  /// (And the most important: the [builders] list have to match the same index of [breakpoints] list)
  final List<ResponsiveBuilderCallback> builders;

  /// Gets the fallback breakpoint when it doesn't find any match
  ResponsiveBuilderCallback get _fallbackBreakpoint => defaultBreakpoint ?? builders.first;

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) =>
        getBuilder(
          size: MediaQuery.of(context).size,
          orientation: orientation,
        )(context, children),
    );
  }

  /// Looks for match breakpoints, if not, use the fallback breakpoint
  ResponsiveBuilderCallback getBuilder({Size size, Orientation orientation}) {
    try {
      final builderIndex = breakpoints.indexWhere((breakpoint) =>
        breakpoint.itMatchesWith(
          size: size,
          currentOrientation: orientation,
        )
      );

      return builders[builderIndex];
    } catch (_) {
      return _fallbackBreakpoint;
    }
  }
}
