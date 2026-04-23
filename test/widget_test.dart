import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:my_portfolio/constants/myinfo.dart';
import 'package:my_portfolio/main.dart';

void main() {
  testWidgets('shows contact and social buttons in the CTA',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1200, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const MyApp());

    expect(find.text('DIGITAL SOULS'), findsOneWidget);
    expect(find.text('QTPAY'), findsOneWidget);
    expect(find.text('CARBO'), findsOneWidget);
    expect(find.text(MyInfo.initiateContact), findsOneWidget);
    expect(find.byTooltip('LinkedIn'), findsOneWidget);
    expect(find.byTooltip('Facebook'), findsOneWidget);
    expect(find.byTooltip('Twitter'), findsOneWidget);
  });
}
