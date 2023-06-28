import 'package:education/Manager/ColourStyle.dart';
import 'package:education/Manager/Constants.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import '../../Manager/Padding.dart';

class LeftToolBarItem extends StatelessWidget {
  const LeftToolBarItem(
      {super.key,
      required this.like,
      required this.comment,
      required this.share,
      required this.bookmark,
      required this.isShowFlip,
      required this.imageURL});

  final int like;
  final int comment;
  final int share;
  final int bookmark;
  final bool isShowFlip;
  final String imageURL;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.leftToolBar,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            padding: AppPadding.bottomOnly20,
            child: Image.network(
              imageURL,
              width: AppSize.s40,
              height: AppSize.s40,
            ),
          ),
          likeButton(context),
          commentButton(context),
          shareButton(context),
          bookmarkButton(context),
          isShowFlip ? flipButton() : Container()
        ],
      ),
    );
  }

  Widget likeButton(BuildContext context) {
    return LikeButton(
        key: const Key("likeButton"),
        size: AppSize.s40,
        bubblesColor: BubblesColor(
          dotPrimaryColor: Theme.of(context).colorScheme.likeDotPrimaryColor,
          dotSecondaryColor:
              Theme.of(context).colorScheme.likeDotSecondaryColor,
        ),
        likeBuilder: (bool isLiked) {
          return Icon(
            ConstantImage.like,
            color: isLiked
                ? Theme.of(context).colorScheme.likeColor
                : Theme.of(context).colorScheme.dislikeColor,
            size: AppSize.s40,
          );
        },
        likeCountPadding: AppPadding.bottomOnly10,
        countPostion: CountPostion.bottom,
        likeCount: like,
        countBuilder: (count, isLiked, text) {
          return Text(
            text,
            style: TextStyle(
              color: Theme.of(context).colorScheme.dislikeColor,
              fontWeight: FontWeight.bold,
            ),
          );
        });
  }

  Widget commentButton(BuildContext context) {
    return LikeButton(
        key: const Key("commentButton"),
        size: AppSize.s40,
        bubblesColor: BubblesColor(
          dotPrimaryColor: Theme.of(context).colorScheme.otherDotPrimaryColor,
          dotSecondaryColor:
              Theme.of(context).colorScheme.otherDotSecondaryColor,
        ),
        likeBuilder: (bool isLiked) {
          return Image.asset(
            ConstantImageName.comment,
            color: Colors.white,
            //  size: buttonSize,
          );
        },
        likeCountPadding: AppPadding.bottomOnly10,
        countPostion: CountPostion.bottom,
        likeCount: comment,
        countBuilder: (count, isLiked, text) {
          return Text(
            text,
            style: TextStyle(
              color: Theme.of(context).colorScheme.dislikeColor,
              fontWeight: FontWeight.bold,
            ),
          );
        });
  }

  Widget shareButton(BuildContext context) {
    return LikeButton(
        key: const Key("shareButton"),
        size: AppSize.s40,
        bubblesColor: BubblesColor(
          dotPrimaryColor: Theme.of(context).colorScheme.otherDotPrimaryColor,
          dotSecondaryColor:
              Theme.of(context).colorScheme.otherDotSecondaryColor,
        ),
        likeBuilder: (bool isLiked) {
          return Image.asset(
            ConstantImageName.share,
            color: Colors.white,
          );
        },
        likeCountPadding: AppPadding.bottomOnly10,
        countPostion: CountPostion.bottom,
        likeCount: share,
        countBuilder: (count, isLiked, text) {
          return Text(
            text,
            style: TextStyle(
              color: Theme.of(context).colorScheme.dislikeColor,
              fontWeight: FontWeight.bold,
            ),
          );
        });
  }

  Widget bookmarkButton(BuildContext context) {
    return LikeButton(
        key: const Key("bookmarkButton"),
        size: AppSize.s40,
        bubblesColor: BubblesColor(
          dotPrimaryColor: Theme.of(context).colorScheme.otherDotPrimaryColor,
          dotSecondaryColor:
              Theme.of(context).colorScheme.otherDotSecondaryColor,
        ),
        likeBuilder: (bool isLiked) {
          return Icon(
            ConstantImage.bookmark,
            color: isLiked ? Colors.yellow : Colors.white,
            size: AppSize.s40,
          );
        },
        likeCountPadding: AppPadding.bottomOnly10,
        countPostion: CountPostion.bottom,
        likeCount: bookmark,
        countBuilder: (count, isLiked, text) {
          return Text(
            text,
            style: TextStyle(
              color: Theme.of(context).colorScheme.dislikeColor,
              fontWeight: FontWeight.bold,
            ),
          );
        });
  }

  Widget flipButton() {
    return IgnorePointer(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          ConstantImageName.flip,
          width: AppSize.s40,
          height: AppSize.s40,
        ),
        const Text(ConstantsMessages.flip,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            )),
      ],
    ));
  }
}
