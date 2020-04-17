import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:responsive_builder/src/breakpoint.dart';

void main() {
  group('ResponsiveBreakpoint', () {
    group('given minHeight', () {
      test('when minHeight fits its current screen size', () {
        final minHeight = 1;
        final size = Size(10, 15);
        final responsiveBreakpoint = ResponsiveBreakpoint.byMinHeight(minHeight);

        final subject = responsiveBreakpoint.itMatchesWith(size: size, currentOrientation: Orientation.landscape);

        expect(subject, isTrue);
      });

      test('when minHeight does not fits its current screen size', () {
        final minHeight = 20;
        final size = Size(10, 15);
        final responsiveBreakpoint = ResponsiveBreakpoint.byMinHeight(minHeight);

        final subject = responsiveBreakpoint.itMatchesWith(size: size, currentOrientation: Orientation.landscape);

        expect(subject, isFalse);
      });
    });

    group('given minWidth', () {
      test('when minWidth fits its current screen size', () {
        final minWidth = 1;
        final size = Size(10, 15);
        final responsiveBreakpoint = ResponsiveBreakpoint.byMinWidth(minWidth);

        final subject = responsiveBreakpoint.itMatchesWith(size: size, currentOrientation: Orientation.landscape);

        expect(subject, isTrue);
      });

      test('when minWidth does not fits its current screen size', () {
        final minWidth = 20;
        final size = Size(10, 15);
        final responsiveBreakpoint = ResponsiveBreakpoint.byMinWidth(minWidth);

        final subject = responsiveBreakpoint.itMatchesWith(size: size, currentOrientation: Orientation.landscape);

        expect(subject, isFalse);
      });
    });

    group('given maxHeight', () {
       test('when maxHeight fits its current screen size', () {
        final maxHeight = 16;
        final responsiveBreakpoint = ResponsiveBreakpoint.byMaxHeight(maxHeight);
        final size = Size(10, 15);

        final subject = responsiveBreakpoint.itMatchesWith(size: size, currentOrientation: Orientation.landscape);

        expect(subject, isTrue);
      });

      test('when maxHeight does not fits its current screen size', () {
        final maxHeight = 14;
        final size = Size(10, 15);
        final responsiveBreakpoint = ResponsiveBreakpoint.byMaxHeight(maxHeight);

        final subject = responsiveBreakpoint.itMatchesWith(size: size, currentOrientation: Orientation.landscape);

        expect(subject, isFalse);
      });
    });

    group('given maxWidth', () {
      test('when maxWidth fits its current screen size', () {
        final maxWidth = 11;
        final size = Size(10, 15);
        final responsiveBreakpoint = ResponsiveBreakpoint.byMaxWidth(maxWidth);

        final subject = responsiveBreakpoint.itMatchesWith(size: size, currentOrientation: Orientation.landscape);

        expect(subject, isTrue);
      });

      test('when maxWidth fits its current screen size', () {
        final maxWidth = 9;
        final size = Size(10, 15);
        final responsiveBreakpoint = ResponsiveBreakpoint.byMaxWidth(maxWidth);

        final subject = responsiveBreakpoint.itMatchesWith(size: size, currentOrientation: Orientation.landscape);

        expect(subject, isFalse);
      });
    });

    group('given portrait orientation', () {
      test('when orientation matches screen orientation', () {
        final size = Size(10, 15);
        final responsiveBreakpoint = ResponsiveBreakpoint.byPortraitMode();

        final subject = responsiveBreakpoint.itMatchesWith(size: size, currentOrientation: Orientation.portrait);

        expect(subject, isTrue);
      });

       test('when orientation does not matches screen orientation', () {
        final size = Size(10, 15);
        final responsiveBreakpoint = ResponsiveBreakpoint.byPortraitMode();
        
        final subject = responsiveBreakpoint.itMatchesWith(size: size, currentOrientation: Orientation.landscape);

        expect(subject, isFalse);
      });
    });

    group('given landscape orientation', () {
      test('when orientation matches screen orientation', () {
        final size = Size(10, 15);
        final responsiveBreakpoint = ResponsiveBreakpoint.byLandscapeMode();

        final subject = responsiveBreakpoint.itMatchesWith(size: size, currentOrientation: Orientation.landscape);

        expect(subject, isTrue);
      });

       test('when orientation does not matches screen orientation', () {
        final size = Size(10, 15);
        final responsiveBreakpoint = ResponsiveBreakpoint.byLandscapeMode();
        
        final subject = responsiveBreakpoint.itMatchesWith(size: size, currentOrientation: Orientation.portrait);

        expect(subject, isFalse);
      });
    });

     group('given maxHeight, maxWidth, MinHeight, minWidth and orientation', () {
      test('when all params match screen size and orientation', () {
        final size = Size(5, 10);
        final responsiveBreakpoint =
          ResponsiveBreakpoint(maxWidth: 10, maxHeight: 10, minHeight: 5, minWidth: 5, orientation: Orientation.landscape );

        final subject = responsiveBreakpoint.itMatchesWith(size: size, currentOrientation: Orientation.landscape);

        expect(subject, isTrue);
      });

      test('when all params do not match screen size and orientation', () {
        final size = Size(4, 11);
        final responsiveBreakpoint =
          ResponsiveBreakpoint(maxWidth: 10, maxHeight: 10, minHeight: 5, minWidth: 5, orientation: Orientation.landscape );

        final subject = responsiveBreakpoint.itMatchesWith(size: size, currentOrientation: Orientation.landscape);

        expect(subject, isFalse);
      });
     });
  });
}
