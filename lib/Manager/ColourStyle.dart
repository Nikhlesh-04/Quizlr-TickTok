import 'package:flutter/material.dart';

extension ColourStyle on ColorScheme {
  Color get answer => const Color.fromARGB(255, 3, 167, 153);
  Color get clear => Colors.redAccent.withOpacity(0.0);
  Color get gold => const Color.fromRGBO(252, 192, 0, 1);
  Color get lightWhite => const Color.fromARGB(255, 206, 205, 203);
  Color get outReward => Colors.blue;
  Color get systemBackground => const Color.fromARGB(255, 192, 191, 191);
  Color get label =>
      (brightness == Brightness.dark) ? Colors.white : Colors.black;
  Color get navigationBar =>
      (brightness == Brightness.dark) ? Colors.black : Colors.white;
  Color get themeBackground =>
      (brightness == Brightness.dark) ? Colors.black : Colors.white;
  Color get tabbarBackground => (brightness == Brightness.dark)
      ? Colors.black
      : const Color.fromARGB(255, 243, 242, 242);
  Color get subTitle => const Color.fromARGB(255, 141, 136, 136);
  Color get subTitleW2 => const Color.fromARGB(255, 123, 118, 118);
  Color get cardBackground => (brightness == Brightness.dark)
      ? const Color.fromARGB(255, 45, 45, 45)
      : const Color.fromARGB(255, 255, 255, 255);
  Color get selectedTab => Colors.white;
  Color get unSelectedTab => const Color.fromARGB(255, 162, 162, 162);
  Color get questionFlipViewFront => const Color.fromRGBO(10, 138, 85, 1);
  Color get questionFlipViewBack => const Color.fromARGB(255, 251, 208, 76);
  Color get mcqViewBackground => const Color.fromARGB(255, 238, 156, 90);
  Color get likeDotPrimaryColor => const Color.fromARGB(255, 255, 51, 0);
  Color get likeDotSecondaryColor => const Color(0xff0099cc);
  Color get otherDotPrimaryColor => Colors.white;
  Color get otherDotSecondaryColor => const Color(0xff0099cc);
  Color get likeColor => Colors.red;
  Color get dislikeColor => Colors.white;
  Color get correctAnswer => Colors.green;
  Color get wrongAnswer => Colors.red;
  Color get appBar => const Color.fromARGB(255, 1, 36, 49);
  Color get playlistBackground => const Color.fromARGB(255, 45, 45, 45);
  Color get divider => const Color.fromARGB(255, 2, 86, 117);
  Color get green => const Color(0xff2DC59F);
  Color get lightOrange => const Color(0xfffBB668);
  Color get orange => const Color(0xfff17D23);
  Color get yellow => const Color(0xffffD449);
  Color get darkGreen => const Color(0xff16624f);
  Color get teal => const Color(0xff1F8a70);
  Color get optionBackground => Colors.white.withOpacity(0.5);
  Color get mcqTitle => Colors.black.withOpacity(0.4);

  LinearGradient get yellowBackgorudLinearGradient =>
      (brightness == Brightness.dark)
          ? const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomLeft,
              colors: <Color>[Colors.cyan, Colors.red, Colors.white])
          : const LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.bottomLeft,
              colors: <Color>[Colors.yellow, Colors.red, Colors.white]);

  LinearGradient get blueBackgorudLinearGradient => const LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: <Color>[Color(0xFF001D28), Color(0xFF00425A)]);

  LinearGradient get nameImageGradient => const LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: <Color>[Colors.white, Color.fromARGB(255, 145, 150, 6)]);

  Color dynamicColour({required Color light, required Color dark}) {
    return (brightness == Brightness.light) ? light : dark;
  }
}
