// ignore: file_names
import 'package:education/Manager/ColourStyle.dart';
import 'package:flutter/material.dart';

import '../../Helper/SharedPreferencesHelper.dart';
import '../../Manager/AppState.dart';
import '../../Manager/Constants.dart';
import '../Manager/Padding.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: AppPadding.all15,
                child: Image.asset(ConstantImageName.logo),
              ),
              Text(ConstantsMessages.welcomeText,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium),
              AppPadding.bottomOnly30,
              OutlinedButton(
                key: const Key('Login'),
                style: OutlinedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    side: const BorderSide(
                        color: Colors.indigoAccent, width: 2.0)), // AND HERE
                onPressed: () {
                  SharedPreferencesHelper.setBool(
                      SharedPreferencesConstants.userState, true);
                  AppState().changeStatus(UserState.isReady);
                },
                child: Container(
                    width: 150,
                    padding: AppPadding.all15,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.account_circle),
                        AppPadding.leftOnly10,
                        Text(
                          'Login',
                          style: TextStyle(fontSize: AppSize.s23),
                        )
                      ],
                    )),
              )
            ],
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.themeBackground);
  }
}
