// ignore: file_names
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Manager/AppState.dart';
import 'Login.dart';
import 'MainContainer.dart';

class DispatchView extends StatefulWidget {
  const DispatchView({super.key});
  @override
  State<DispatchView> createState() => _DispatchViewState();
}

class _DispatchViewState extends State<DispatchView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(builder: (context, state, child) {
      switch (AppState().getStatus()) {
        case UserState.login:
          return const Login();
        case UserState.isReady:
          return const MainContainer();
      }
    });
  }
}
