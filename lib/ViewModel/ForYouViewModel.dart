// ignore: file_names
import 'package:flutter/cupertino.dart';
import '../Core/DataServiceManager.dart';
import '../Models/ForYou.dart';

class ForYouViewModel with ChangeNotifier {
  bool hudVisible = true;
  ForYou? _forYouData;

  ForYou? get forYou {
    return _forYouData;
  }

  ForYouViewModel() {
    fetchForYou();
  }

  Future<void> fetchForYou() async {
    hudVisible = true;
    ForYou response = await DataManager.getForYou();
    hudVisible = false;
    _forYouData = response;
    notifyListeners();
  }
}
