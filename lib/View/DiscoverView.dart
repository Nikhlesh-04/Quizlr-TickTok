// ignore: file_names
import 'package:education/Manager/ColourStyle.dart';
import 'package:flutter/material.dart';
import '../Helper/CustomAppBar.dart';
import '../Manager/Constants.dart';

class DiscoverView extends StatelessWidget {
  const DiscoverView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBar(
          backgroundColor: Theme.of(context).colorScheme.themeBackground,
          title: const Text(ConstantsMessages.discoverTitle,
              style: TextStyle(fontWeight: FontWeight.bold)),
          actions: [
            IconButton(
              onPressed: () {},
              icon: ConstantImage.search,
            )
          ],
        ),
        body: const Center(
            child: Text(
          ConstantsMessages.comingSoon,
          textScaleFactor: 1.5,
          textAlign: TextAlign.center,
        )));
  }
}
