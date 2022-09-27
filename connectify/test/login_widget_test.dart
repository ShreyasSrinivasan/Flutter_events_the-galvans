import 'package:connectify/login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget createWidgetForTesting({Widget? child}) {
    return MaterialApp(
      home: child,
    );
  }

  testWidgets('Login widget have email and password text fields test',
      (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: const LoginScreen()));

    var textField = find.byType(TextField);
    expect(textField, findsWidgets);
    await tester.enterText(textField.at(0), 'email@gmail.com');
    await tester.enterText(textField.at(1), 'qwerty');
    expect(find.text('email@gmail.com'), findsOneWidget);
    expect(find.text('qwerty'), findsOneWidget);
  });

  testWidgets('Login widget have log in buttons test',
      (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: const LoginScreen()));

    expect(find.text('Log in'), findsOneWidget);
  });
}
