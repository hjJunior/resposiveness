import 'package:flutter/material.dart';
import 'package:responsive_builder/src/breakpoint.dart';

/// A widget that render according with
class ResponsiveBuilder extends StatelessWidget {
  ResponsiveBuilder({
    @required
    this.breakpoints,
    this.children,
    this.defaultBreakpoint,
  }) : assert(breakpoints.isNotEmpty);

  /// Define a list of [ResponsiveBreakpoint] which defines when should display new layout
  final List<ResponsiveBreakpoint> breakpoints;

  /// (Optional) default breakpoint, if not set will be used the first on breakpoints
  final ResponsiveBreakpoint defaultBreakpoint;

  /// (Optional) a list of children to be passed to the builder method
  /// If possible prefer use it instead create all render tree on builder
  final List<Widget> children;

  /// Gets the fallback breakpoint when not found any match
  get _fallbackBreakpoint => defaultBreakpoint ?? breakpoints.first;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final currentSize = MediaQuery.of(context).size;

        return currentBreakpoint(currentSize).builder(context, constraints, children);
      }
    );
  }

  /// Looks for match breakpoints if not use fallback breakpoint
  ResponsiveBreakpoint currentBreakpoint(Size size) {
    try {
      return breakpoints.firstWhere((breakpoint) =>
        breakpoint.hasMatchWithSize(size)
      );
    } catch (_) {
      return _fallbackBreakpoint;
    }
  }
}
