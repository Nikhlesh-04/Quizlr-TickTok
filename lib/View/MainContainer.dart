// ignore: file_names
import 'package:education/Manager/ColourStyle.dart';
import 'package:flutter/material.dart';

import '../../Manager/Constants.dart';
import '../Manager/Padding.dart';
import 'ActivityView.dart';
import 'BookmarkView.dart';
import 'DiscoverView.dart';
import 'HomeView.dart';
import 'ProfileView.dart';

class MainContainer extends StatefulWidget {
  const MainContainer({super.key});
  @override
  State<MainContainer> createState() => _MainContainerState();
}

class _MainContainerState extends State<MainContainer> {
  int tabIndex = 0;
  late List<Widget> listScreens;

  @override
  void initState() {
    super.initState();
    listScreens = [
      const HomeView(),
      const DiscoverView(),
      const ActivityView(),
      const BookmarkView(),
      const ProfileView(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: listScreens[tabIndex],
      bottomNavigationBar: BottomNavigationBar(
          key: const Key('BottomNavigationBar'),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Theme.of(context).colorScheme.selectedTab,
          unselectedItemColor: Theme.of(context).colorScheme.unSelectedTab,
          selectedFontSize: AppSize.s12,
          unselectedFontSize: AppSize.s12,
          backgroundColor: Theme.of(context).colorScheme.tabbarBackground,
          currentIndex: tabIndex,
          onTap: (int index) {
            setState(() {
              tabIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              tooltip: 'Home',
              icon: Icon(ConstantImage.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              tooltip: 'Discover',
              icon: Icon(ConstantImage.discover),
              label: 'Discover',
            ),
            BottomNavigationBarItem(
              tooltip: 'Activity',
              icon: Icon(ConstantImage.activity),
              label: 'Activity',
            ),
            BottomNavigationBarItem(
              tooltip: 'Bookmarks',
              icon: Icon(ConstantImage.bookmark),
              label: 'Bookmarks',
            ),
            BottomNavigationBarItem(
              tooltip: 'Profile',
              icon: Icon(ConstantImage.personCircle),
              label: 'Profile',
            ),
          ]),
    );
  }
}
