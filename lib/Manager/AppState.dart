import 'package:education/Helper/CustomAppBar.dart';
import 'package:flutter/material.dart';
import '../Helper/SharedPreferencesHelper.dart';
import 'Constants.dart';

enum UserState { login, isReady }

class UserS {
  var state = UserState.login;
}

class AppState extends ChangeNotifier {
  static final AppState _shared = AppState._internal();
  UserS? _user;

  bool _disposed = false;

  factory AppState() {
    return _shared;
  }

  AppState._internal() {
    _user = UserS();
    _initState();
  }

  _initState() async {
    UserState status = await getUserState();
    _user?.state = status;
    notifyListeners();
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }

  @override
  void notifyListeners() {
    if (!_disposed) {
      super.notifyListeners();
    }
  }

  void changeStatus(UserState status) {
    _user?.state = status;
    AppTimer().resetTimer();
    notifyListeners();
  }

  Future<UserState> getUserState() async {
    bool status = await SharedPreferencesHelper.getBool(
        SharedPreferencesConstants.userState);
    if (status == true) {
      return loginHandler();
    }
    return UserState.login;
  }

  UserState getStatus() {
    return _user!.state;
  }

  UserState loginHandler() {
    return UserState.isReady;
  }
}
