// ignore: file_names
import 'package:flutter/cupertino.dart';
import '../Core/DataServiceManager.dart';
import '../Models/Following.dart';

class FollowingViewModel with ChangeNotifier {
  bool hudVisible = true;
  Following? _following;

  Following? get following {
    return _following;
  }

  FollowingViewModel() {
    fetchFollowing();
  }

  Future<void> fetchFollowing() async {
    hudVisible = true;
    Following response = await DataManager.getFollowing();
    hudVisible = false;
    _following = response;
    notifyListeners();
  }
}
