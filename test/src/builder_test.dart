import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:resposiveness/src/builder.dart';
import 'package:resposiveness/src/breakpoint.dart';

void main() {
  Widget buildHelperFor(Size size) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: MediaQuery(
        data: MediaQueryData(
          size: size,
        ),
        child: ResposivenessWidget.builder(
          breakpoints: [
            ResposivenessBreakpoint(
              maxWidth: 70,
              maxHeight: 70,
            ),
            ResposivenessBreakpoint.byPortraitMode(),
            ResposivenessBreakpoint.byLandscapeMode(),
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

  testWidgets('when custom breakpoint', (tester) async {
    final TestWidgetsFlutterBinding binding =
        TestWidgetsFlutterBinding.ensureInitialized();
    final testingSize = Size(50, 50);

    await binding.setSurfaceSize(testingSize);
    await tester.pumpWidget(buildHelperFor(testingSize));

    expect(find.text('custom'), findsOneWidget);
  });

  testWidgets('when portrait orientation', (tester) async {
    final TestWidgetsFlutterBinding binding =
        TestWidgetsFlutterBinding.ensureInitialized();
    final testingSize = Size(200, 400);

    await binding.setSurfaceSize(testingSize);
    await tester.pumpWidget(buildHelperFor(testingSize));

    expect(find.text('portrait'), findsOneWidget);
  });

  testWidgets('when landscape orientation', (tester) async {
    final TestWidgetsFlutterBinding binding =
        TestWidgetsFlutterBinding.ensureInitialized();
    final testingSize = Size(400, 200);

    await binding.setSurfaceSize(testingSize);
    await tester.pumpWidget(buildHelperFor(testingSize));

    expect(find.text('landscape'), findsOneWidget);
  });
}
