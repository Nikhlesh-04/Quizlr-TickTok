// ignore: file_names
import 'package:education/Manager/ColourStyle.dart';
import 'package:education/Manager/Padding.dart';
import 'package:flutter/material.dart';
import '../Manager/Constants.dart';
import '../Helper/CustomAppBar.dart';
import 'FollowingView.dart';
import 'ForYouView.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int segmentIndex = 0;
  late List<Widget> listScreens;

  @override
  void initState() {
    super.initState();
    listScreens = [const FollowingView(), const ForYouView()];
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBar(
          backgroundColor: Theme.of(context).colorScheme.appBar,
          title: const Text(ConstantsMessages.homeTitle,
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
          child: Column(
            children: [
              Container(
                constraints:
                    BoxConstraints(minWidth: MediaQuery.of(context).size.width),
                child: DefaultTabController(
                  length: 2,
                  child: TabBar(
                    padding: AppPadding.leftRightOnly15,
                    indicatorWeight: 3,
                    labelColor: Colors.white,
                    indicatorColor: Colors.white,
                    dividerColor: Theme.of(context).colorScheme.clear,
                    tabs: [
                      Container(
                        padding: AppPadding.all10,
                        child: const Text(
                            ConstantsMessages.followingSegementTitle,
                            textScaleFactor: 1.2,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        padding: AppPadding.all10,
                        child: const Text(ConstantsMessages.forYouSegementTitle,
                            textScaleFactor: 1.2,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ],
                    onTap: (value) {
                      setState(() {
                        segmentIndex = value;
                      });
                    },
                  ),
                ),
              ),
              // Wrap in a Container
              Expanded(
                child: listScreens[segmentIndex],
              )
            ],
          ),
        ));
  }
}
