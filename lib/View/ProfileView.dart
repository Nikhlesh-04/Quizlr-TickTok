// ignore: file_names
import 'package:education/Manager/ColourStyle.dart';
import 'package:flutter/material.dart';
import '../Helper/SharedPreferencesHelper.dart';
import '../Manager/AppState.dart';
import '../Manager/Constants.dart';
import '../Manager/Padding.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.appBar,
          title: const Text("Neo Anderson",
              style: TextStyle(fontWeight: FontWeight.bold)),
          actions: [
            IconButton(
              onPressed: () {},
              icon: ConstantImage.search,
            )
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
              gradient:
                  Theme.of(context).colorScheme.blueBackgorudLinearGradient),
          constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.83),
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                      gradient: Theme.of(context).colorScheme.nameImageGradient,
                      shape: BoxShape.circle),
                  child: const Center(
                      child: Text(
                    "N",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                  )),
                ),
                Container(
                  padding: AppPadding.topOnly10,
                  child: const Text(
                    "@neonanderson",
                    key: Key("handle"),
                    style: TextStyle(fontWeight: FontWeight.w500),
                    textScaleFactor: 1.2,
                  ),
                ),
                getFollowerAndFollowingCountView(context),
                const Spacer(),
                OutlinedButton(
                  key: const Key('Logout'),
                  style: OutlinedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      side: const BorderSide(
                          color: Colors.white, width: 2.0)), // AND HERE
                  onPressed: () {
                    SharedPreferencesHelper.delete(
                        SharedPreferencesConstants.userState);
                    AppState().changeStatus(UserState.login);
                  },
                  child: Container(
                      width: MediaQuery.of(context).size.width * 0.88,
                      padding: const EdgeInsets.all(15),
                      child: const Center(
                        child: Text(
                          'Logout',
                          style: TextStyle(fontSize: 23.0),
                        ),
                      )),
                )
              ]),
        ));
  }

  Widget getFollowerAndFollowingCountView(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _getCountView(context, "33", "Following"),
        Container(
          width: 50,
          color: Theme.of(context).colorScheme.divider,
        ),
        _getCountView(context, "74", "Followers")
      ],
    );
  }

  Widget _getCountView(BuildContext context, String count, String text) {
    return Column(
      children: [
        Container(
          padding: AppPadding.topOnly10,
          child: Text(
            key: const Key("count"),
            count,
            style: const TextStyle(fontWeight: FontWeight.w500),
            textScaleFactor: 1.2,
          ),
        ),
        Container(
          padding: AppPadding.topOnly10,
          child: Text(
            key: const Key("title"),
            text,
            style: const TextStyle(fontWeight: FontWeight.w300),
          ),
        )
      ],
    );
  }
}
