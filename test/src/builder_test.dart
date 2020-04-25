import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:responsive_builder/src/builder.dart';
import 'package:responsive_builder/src/breakpoint.dart';

void main() {
  Widget buildHelperFor(Size size) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: MediaQuery(
        data: MediaQueryData(
          size: size,
        ),
        child: ResponsiveBuilder(
          breakpoints: [
            ResponsiveBreakpoint(
              maxWidth: 45,
              maxHeight: 45,
            ),
            ResponsiveBreakpoint.byPortraitMode(),
            ResponsiveBreakpoint.byLandscapeMode(),
          ],
          builders: [
            (_, __) => Text('custom'),
            (_, __) => Text('portrait'),
            (_, __) => Text('landscape'),
          ],
        ),
      ),
    );
  }

  testWidgets('when media query matches the device custom breakpoint', (tester) async {
    final testingSize = Size(45, 45);
    await tester.pumpWidget(buildHelperFor(testingSize));

    expect(find.text('custom'), findsOneWidget);
  });

   testWidgets('when media query matches the device portrait orientation', (tester) async {
    final testingSize = Size(50, 100);
    await tester.pumpWidget(buildHelperFor(testingSize));

    expect(find.text('portrait'), findsOneWidget);
  });

  testWidgets('when media query matches the device landscape orientation', (tester) async {
    final testingSize = Size(100, 50);
    await tester.pumpWidget(buildHelperFor(testingSize));

    expect(find.text('landscape'), findsOneWidget);
  });

}