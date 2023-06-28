// ignore: file_names
import 'package:education/Models/Answer.dart';
import 'package:flutter/cupertino.dart';
import '../Core/DataServiceManager.dart';

class AnswersViewModel with ChangeNotifier {
  bool hudVisible = true;
  Answer? _answer;

  Answer? get answer {
    return _answer;
  }

  Future<void> fetchAnswer(int id) async {
    hudVisible = true;
    Answer response = await DataManager.getAnswer(id.toString());
    hudVisible = false;
    _answer = response;
    notifyListeners();
  }
}
