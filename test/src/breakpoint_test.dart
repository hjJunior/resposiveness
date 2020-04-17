import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../lib/src/breakpoint.dart';

void main() {
  group('ResponsiveBreakpoint', () {
    group('Factories', () {
      test('it should define a breakpoint using minimun heigth', () {
        final minHeight = 100;
        final result = ResponsiveBreakpoint.byMinHeight(minHeight: minHeight);

        expect(result.minHeight, minHeight);
      });

      test('it should define a breakpoint using minimun width', () {
        final minWidth = 100;
        final result = ResponsiveBreakpoint.byMinWidth(minWidth: minWidth);

        expect(result.minWidth, minWidth);
      });

      test('it should define a breakpoint using maximum heigth', () {
        final maxHeight = 100;
        final result = ResponsiveBreakpoint.byMaxHeight(maxHeight: maxHeight);

        expect(result.maxHeight, maxHeight);
      });

      test('it should define a breakpoint using maximum width', () {
        final maxWidth = 100;
        final result = ResponsiveBreakpoint.byMaxWidth(maxWidth: maxWidth);

        expect(result.maxWidth, maxWidth);
      });

      test('it should define a breakpoint using portrait orientation', () {
        final result = ResponsiveBreakpoint.byPortraitMode();
        expect(result.orientation, Orientation.portrait);
      });

      test('it should define a breakpoint using landscape orientation', () {
        final result = ResponsiveBreakpoint.byLandscapeMode();
        expect(result.orientation, Orientation.landscape);
      });
    });
  });
}
