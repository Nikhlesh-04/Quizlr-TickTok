// ignore: file_names
import 'package:education/Manager/ColourStyle.dart';
import 'package:education/Manager/Constants.dart';
import 'package:education/View/Components/LeftToolBarItem.dart';
import 'package:education/View/Components/PlaylistItem.dart';
import 'package:education/View/Components/UserInfoItem.dart';
import 'package:education/View/Components/flashcardItem.dart';
import 'package:education/ViewModel/FollowingViewModel.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import '../Helper/ProgressHUD.dart';
import 'package:tiktoklikescroller/tiktoklikescroller.dart';
import '../Manager/Padding.dart';

class FollowingView extends StatefulWidget {
  const FollowingView({super.key});
  @override
  State<FollowingView> createState() => _FollowingViewState();
}

class _FollowingViewState extends State<FollowingView> {
  final FollowingViewModel viewModel = FollowingViewModel();
  bool hudVisible = true;
  late final Controller controller;
  late final FlipCardController flipController;
  int initialPageList = 1;

  @override
  void initState() {
    viewModel.addListener(() {
      setState(() {
        hudVisible = viewModel.hudVisible;
      });
    });
    controller = Controller()
      ..addListener((event) {
        _handleCallbackEvent(event.direction, event.success, context);
      });
    flipController = FlipCardController();
    super.initState();
  }

  @override
  void dispose() {
    viewModel.removeListener(() {});
    viewModel.dispose();
    super.dispose();
  }

  void _handleCallbackEvent(
      ScrollDirection direction, ScrollSuccess success, BuildContext context) {
    if (success == ScrollSuccess.SUCCESS &&
        direction == ScrollDirection.FORWARD) {
      viewModel.fetchFollowing();
      setState(() {
        initialPageList++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TikTokStyleFullPageScroller(
      controller: controller,
      swipePositionThreshold: AppSize.s0_2,
      builder: (BuildContext context, int index) {
        return ProgressHUD(
            inAsyncCall: viewModel.hudVisible,
            child: Stack(alignment: Alignment.bottomRight, children: [
              Container(
                constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height * 0.8),
                color: Theme.of(context).colorScheme.clear,
                child: FlashCardItem(
                  frontText: viewModel.following?.flashcard_front ?? "",
                  backText: viewModel.following?.flashcard_back ?? "",
                  index: index,
                  flipController: flipController,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  FittedBox(
                    fit: BoxFit.fitHeight,
                    child: UserInfoItem(
                        name: viewModel.following?.user.name ?? "",
                        description: viewModel.following?.description ?? ""),
                  ),
                  Container(
                    color: Theme.of(context).colorScheme.playlistBackground,
                    child:
                        PlaylistItem(name: viewModel.following?.playlist ?? ""),
                  )
                ],
              ),
              // ignore: prefer_const_constructors
              FittedBox(
                fit: BoxFit.fill,
                // ignore: prefer_const_constructors
                child: LeftToolBarItem(
                  like: 51,
                  comment: 10,
                  share: 12,
                  bookmark: 2,
                  isShowFlip: true,
                  imageURL: viewModel.following?.user.avatar ??
                      ConstantImageName.defaultUserImage,
                ),
              )
            ]));
      },
      contentSize: initialPageList + 1,
    );
  }
}
