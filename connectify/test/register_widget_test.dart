import 'dart:math';

import 'package:connectify/register/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget createWidgetForTesting({Widget? child}) {
    return MaterialApp(
      home: child,
    );
  }

  testWidgets(
      'Register widget have name, email, linkedin-profile and password text fields test',
      (WidgetTester tester) async {
    await tester
        .pumpWidget(createWidgetForTesting(child: const RegisterScreen()));

    var textField = find.byType(TextField);
    expect(textField, findsWidgets);
    await tester.enterText(textField.at(0), 'John');
    await tester.enterText(textField.at(1), 'email@gmail.com');
    await tester.enterText(textField.at(2), 'www.linkedin.com/in/john');
    await tester.enterText(textField.at(3), 'qwerty');
    expect(find.text('John'), findsOneWidget);
    expect(find.text('email@gmail.com'), findsOneWidget);
    expect(find.text('www.linkedin.com/in/john'), findsOneWidget);
    expect(find.text('qwerty'), findsOneWidget);
  });

  testWidgets('Register widget Sign Up button test',
      (WidgetTester tester) async {
    await tester
        .pumpWidget(createWidgetForTesting(child: const RegisterScreen()));
    expect(find.text('Sign up'), findsOneWidget);
  });
}
