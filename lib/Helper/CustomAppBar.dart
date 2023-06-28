import 'dart:async';
import 'package:flutter/material.dart';
import '../Manager/Constants.dart';
import '../Manager/Padding.dart';

class CommonAppBar extends AppBar {
  @override
  // ignore: overridden_fields
  final Widget title;
  @override
  // ignore: overridden_fields
  final Color? backgroundColor;
  @override
  // ignore: overridden_fields
  final List<Widget>? actions;
  CommonAppBar(
      {super.key, required this.title, this.actions, this.backgroundColor})
      : super(
            backgroundColor: backgroundColor,
            title: title,
            actions: actions,
            leadingWidth: 120,
            leading: const Row(
              children: [
                Padding(padding: AppPadding.all5),
                ConstantImage.timer,
                TimerView()
              ],
            ));
}

class AppTimer with ChangeNotifier {
  static final AppTimer shared = AppTimer._internal();

  late Duration _elapsedTime;
  late String formattedTime = "";
  late Timer _timer;
  bool _disposed = false;

  factory AppTimer() {
    return shared;
  }

  AppTimer._internal() {
    _elapsedTime = Duration.zero;
    _initState();
  }

  _initState() {
    startAppTime();
  }

  @override
  void dispose() {
    _disposed = true;
    _timer.cancel();
    super.dispose();
  }

  void resetTimer() {
    _elapsedTime = Duration.zero;
  }

  @override
  void notifyListeners() {
    if (!_disposed) {
      super.notifyListeners();
    }
  }

  void startAppTime() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      _elapsedTime += const Duration(seconds: 1);
      formattedTime =
          '${_elapsedTime.inMinutes.toString().padLeft(2, '0')}m ${(_elapsedTime.inSeconds % 60).toString().padLeft(2, '0')}s';
      formattedTime;
      notifyListeners();
    });
  }
}

class TimerView extends StatefulWidget {
  const TimerView({super.key});
  @override
  State<TimerView> createState() => _TimerViewState();
}

class _TimerViewState extends State<TimerView> {
  String timeString = "";
  late AppTimer? appTimer;

  @override
  void initState() {
    super.initState();
    appTimer = AppTimer();
    appTimer?.addListener(() {
      if (mounted) {
        setState(() {
          timeString = appTimer?.formattedTime ?? "";
        });
      }
    });
  }

  @override
  void dispose() {
    appTimer?.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(timeString,
        style: const TextStyle(fontWeight: FontWeight.bold));
  }
}
