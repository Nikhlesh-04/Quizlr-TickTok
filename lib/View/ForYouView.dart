// ignore: file_names
import 'package:education/Manager/ColourStyle.dart';
import 'package:flutter/material.dart';
import 'package:tiktoklikescroller/tiktoklikescroller.dart';
import '../Helper/ProgressHUD.dart';
import '../Manager/Constants.dart';
import '../Manager/Padding.dart';
import '../ViewModel/AnswersViewModel.dart';
import '../ViewModel/ForYouViewModel.dart';
import 'Components/LeftToolBarItem.dart';
import 'Components/McqQuestionItem.dart';
import 'Components/PlaylistItem.dart';
import 'Components/UserInfoItem.dart';

class ForYouView extends StatefulWidget {
  const ForYouView({super.key});
  @override
  State<ForYouView> createState() => _ForYouViewState();
}

class _ForYouViewState extends State<ForYouView> {
  final ForYouViewModel viewModel = ForYouViewModel();
  final AnswersViewModel answerViewModel = AnswersViewModel();
  late final Controller controller;
  bool hudVisible = true;
  int selectedIndex = -1;
  int initialPageList = 1;

  @override
  void initState() {
    super.initState();
    viewModel.addListener(() {
      answerViewModel.fetchAnswer(viewModel.forYou?.id ?? 0);
    });
    answerViewModel.addListener(() {
      setState(() {
        hudVisible = viewModel.hudVisible;
      });
    });
    controller = Controller()
      ..addListener((event) {
        _handleCallbackEvent(event.direction, event.success, context);
      });
    super.initState();
  }

  @override
  void dispose() {
    viewModel.removeListener(() {});
    viewModel.dispose();
    answerViewModel.removeListener(() {});
    answerViewModel.dispose();
    super.dispose();
  }

  void _handleCallbackEvent(
      ScrollDirection direction, ScrollSuccess success, BuildContext context) {
    if (success == ScrollSuccess.SUCCESS &&
        direction == ScrollDirection.FORWARD) {
      viewModel.fetchForYou();
      setState(() {
        selectedIndex = -1;
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
                decoration: BoxDecoration(
                  color: Colors.black,
                  image: DecorationImage(
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.4), BlendMode.dstATop),
                    image: AssetImage(ConstantImageName.background),
                    fit: BoxFit.cover,
                  ),
                ),
                // color: Theme.of(context).colorScheme.clear,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: AppPadding.mcqCard,
                      constraints: BoxConstraints(
                          maxHeight:
                              MediaQuery.of(context).size.height * 0.515),
                      child: McqQuestionItem(
                        questionText: viewModel.forYou?.question ?? "",
                        options: viewModel.forYou?.options ?? [],
                        answerID:
                            answerViewModel.answer?.correct_options.first.id ??
                                "",
                        selectedIndex: selectedIndex,
                        ontapItem: (int value) {
                          setState(() {
                            selectedIndex = value;
                          });
                        },
                      ),
                    ),
                    const Spacer(),
                    FittedBox(
                      fit: BoxFit.fitHeight,
                      child: UserInfoItem(
                          name: viewModel.forYou?.user.name ?? "",
                          description: viewModel.forYou?.description ?? ""),
                    ),
                    Container(
                      color: Theme.of(context).colorScheme.playlistBackground,
                      child:
                          PlaylistItem(name: viewModel.forYou?.playlist ?? ""),
                    )
                  ],
                ),
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
                  isShowFlip: false,
                  imageURL: viewModel.forYou?.user.avatar ??
                      ConstantImageName.defaultUserImage,
                ),
              )
            ]));
      },
      contentSize: initialPageList + 1,
    );
  }
}
