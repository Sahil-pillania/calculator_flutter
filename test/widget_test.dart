import 'package:calculatorapp/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
    "Calculator test",
    (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());

      expect(find.byType(Column), findsOneWidget);
      expect(find.text("Welcome"), findsNothing);
      expect(find.byKey(const Key("result")), findsOneWidget);
    },
  );
}
