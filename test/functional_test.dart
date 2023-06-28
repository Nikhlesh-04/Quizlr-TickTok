// ignore: depend_on_referenced_packages
import 'package:education/Core/DataServiceManager.dart';
import 'package:education/Models/Answer.dart';
import 'package:education/Models/Following.dart';
import 'package:education/Models/ForYou.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_test/flutter_test.dart';

void main() {
  // NOTE: I create UI and Unit test cases for as API response, but we can also create UI and Unit test cases from create stub and Mock data.

  // We can also use groups testing functions.

// Close the connection to the driver after the tests have completed.
  tearDown(() {});

  test('test Get Following API Working or not', () async {
    Following following = await DataManager.getFollowing();
    expect(following.type.length, greaterThan(0));
    expect(following.description.length, greaterThan(0));
    expect(following.flashcard_front.length, greaterThan(0));
    expect(following.flashcard_back.length, greaterThan(0));
    expect(following.user.name.length, greaterThan(0));
  });

  test('test Get For You API Working or not', () async {
    ForYou foryou = await DataManager.getForYou();
    expect(foryou.type.length, greaterThan(0));
    expect(foryou.description.length, greaterThan(0));
    expect(foryou.question.length, greaterThan(0));
    expect(foryou.options.length, greaterThan(0));
    expect(foryou.user.name.length, greaterThan(0));

    if (foryou.options.isNotEmpty) {
      Option object = foryou.options.first;
      expect(object.id.length, greaterThan(0));
      expect(object.answer.length, greaterThan(0));
    }
  });

  test('test Get Answer API working or not', () async {
    Answer answer = await DataManager.getAnswer('3794');
    expect(answer.id, greaterThan(0));

    if (answer.correct_options.isNotEmpty) {
      Option object = answer.correct_options.first;
      expect(object.id.length, greaterThan(0));
      expect(object.answer.length, greaterThan(0));
    }
  });
}
