// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:education/Manager/AppState.dart';
import 'package:education/Manager/Constants.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_test/flutter_test.dart';

import 'package:education/main.dart';
import 'package:provider/provider.dart';

Widget createHomeScreen() => ChangeNotifierProvider(
      create: (context) => AppState(),
      child: const MyApp(),
    );

void main() {
  testWidgets('Home Page Widget Tests -- testLogin',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(createHomeScreen());

    expect(find.text(ConstantsMessages.welcomeText), findsOneWidget);

    expect(find.text('Login'), findsOneWidget);
  });
}
