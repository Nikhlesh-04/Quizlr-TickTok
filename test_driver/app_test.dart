// Imports the Flutter Driver API.
import 'package:flutter/foundation.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

/*
    To test automated UI test cases Run command: flutter drive --target=test_driver/app.dart
    I am using driver to test entire UI test cases.
*/

void main() {
  group('education App', () {
    // First, define the Finders and use them to locate widgets from the
    // test suite. Note: the Strings provided to the `byValueKey` method must
    // be the same as the Strings we used for the Keys in step 1.

    late FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      driver.close();
    });

    test('check flutter driver health', () async {
      Health health = await driver.checkHealth();
      if (kDebugMode) {
        print(health.status);
      }
    });

    test('Login app', () async {
      await driver.waitFor(find.text('Login'));
      await driver.waitFor(find.text('Welcome to Quizlr'));
      await driver.tap(find.byValueKey('Login'));
    });

    test('test Home front screen', () async {
      await driver.waitFor(find.byValueKey('frontText'));
      await driver.waitFor(find.text("Following"));
      await driver.waitFor(find.byValueKey("Playlist"));
      await driver.waitFor(find.text("For You"));
    });

    test('test Home back screen', () async {
      await driver.tap(find.byValueKey('frontText'));
      await driver.waitFor(find.text("Answer"));
      await driver.waitFor(find.text("How well did you know this?"));
      await driver.waitFor(find.text("1"));
    });

    test('test side toolbar', () async {
      await driver.tap(find.byValueKey('likeButton'));
      await driver.tap(find.byValueKey('commentButton'));
      await driver.tap(find.byValueKey('bookmarkButton'));
      await driver.tap(find.byValueKey('shareButton'));
    });

    test('test Home for you section', () async {
      await driver.tap(find.text("For You"));
      await driver.waitFor(find.byValueKey('question'));
      await driver.tap(find.byValueKey('0 Cell'));
      await driver.waitFor(find.byValueKey('question_table_view'));
    });

    test('test Account Info', () async {
      await driver.waitFor(find.byValueKey('BottomNavigationBar'));
      await driver.tap(find.byTooltip('Profile'));
      await driver.waitFor(find.byValueKey("handle"));
      await driver.waitFor(find.byValueKey("count"));
      await driver.waitFor(find.byValueKey("title"));
    });

    test('test Logout', () async {
      await driver.waitFor(find.text('Logout'));
      await driver.tap(find.byValueKey('Logout'));
      await driver.waitFor(find.text('Welcome to Quizlr'));
    });
  });
}
