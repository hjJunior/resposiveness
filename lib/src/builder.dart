import 'package:flutter/material.dart';
import 'package:resposiveness/src/breakpoint.dart';

/// A callback used when the breakpoint matches with the current size
typedef ResposivenessBuilder = Widget Function(
  BuildContext context,
  List<Widget> children,
);

/// A widget that renders according with the breakpoint list
class ResposivenessWidget extends StatelessWidget {
  ResposivenessWidget.builder({
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
  final List<ResposivenessBreakpoint> breakpoints;

  /// (Optional) define a default breakpoint, if it's not setted, it will be used primarily on breakpoints
  final ResposivenessBreakpoint defaultBreakpoint;

  /// (Optional) a list of children to be passed to the builder method
  /// If possible, use it instead of create all render tree on builder
  final List<Widget> children;

  /// The builder, responsible to render the Widgets according to the breakpoints
  /// (The [builders] list must have the same size of the [breakpoints] list)
  /// (And the most important: the [builders] list have to match the same index of [breakpoints] list)
  final List<ResposivenessBuilder> builders;

  /// Gets the fallback breakpoint when it doesn't find any match
  ResposivenessBuilder get _fallbackBreakpoint => defaultBreakpoint ?? builders.first;

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
  ResposivenessBuilder getBuilder({Size size, Orientation orientation}) {
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
