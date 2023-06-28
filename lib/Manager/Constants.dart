// ignore: file_names
import 'dart:ui';
import 'package:education/Manager/Padding.dart';
import 'package:flutter/material.dart';

class Constants {
  //Size in physical pixels
  // ignore: deprecated_member_use
  static var kScreenWidth = window.physicalSize.width;
  // ignore: deprecated_member_use
  static var kScreenHeight = window.physicalSize.height;

  static const kHeaders = {"Content-Type": "application/json"};

// ignore: deprecated_member_use
  static var currentTheme = window.platformBrightness;
}

class SharedPreferencesConstants {
  static const userState = "UserState";
}

class ApiConstants {
  static const apiTimeoutTime = 60; //Seconds.
}

class ApiURLs {
  static const baseURL = 'https://cross-platform.rp.devfactory.com/';
}

// MARK: - Error Messages Objects.
class ConstantsMessages {
  static const welcomeText = "Welcome to Quizlr";
  static const comingSoon = "This feature will be available soon";
  static const correctAnswer = "Great, Your answer is correct.";
  static const wrongAnswer = "OPP's, Your answer is wrong.";
  static const activityTitle = "Activity";
  static const bookmarkTitle = "Bookmarks";
  static const homeTitle = "Home";
  static const discoverTitle = "Discover";
  static const followingSegementTitle = "Following";
  static const forYouSegementTitle = "For You";
  static const answer = 'Answer';
  static const flip = "Flip";
  static const playlist = "Playlist •";
  static const ratingHeader = 'How well did you know this?';
}

class Identifiers {
  static const rewardTable = "reward_table_view";
  static const rewardDetailTable = "rewardDetail_table_view";
  static const accountTable = "account_table_view";
}

class ConstantImage {
  static var avatar = Image.asset('assets/images/avatar.png');
  static var logo = Image.asset('assets/images/logo.png');
  static var flip = Image.asset('assets/images/flip.png');
  static var playlist = Image.asset(
    'assets/images/playlist.png',
    width: AppSize.s23,
  );
  static const personCircle = Icons.account_circle_rounded;
  static const home = Icons.home;
  static const discover = Icons.explore;
  static const activity = Icons.notifications;
  static const bookmark = Icons.bookmark;
  static const like = Icons.favorite;
  //static const flip = Icons.cached;
  static const search = Icon(Icons.search);
  static const timer = Icon(Icons.timer);
  static const listCellDiscloseArrow = Icon(Icons.keyboard_arrow_right);
}

class ConstantImageName {
  static var logo = 'assets/images/logo.png';
  static var comment = 'assets/images/comment.png';
  static var share = 'assets/images/share.png';
  static var flip = 'assets/images/flip.png';
  static var playlist = 'assets/images/playlist.png';
  static var background = "assets/images/background.jpg";
  static var defaultUserImage =
      "https://cdn.pixabay.com/photo/2019/08/11/18/59/icon-4399701_1280.png";
}
