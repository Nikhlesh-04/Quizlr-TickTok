import 'package:education/Manager/ColourStyle.dart';
import 'package:education/Manager/Padding.dart';
import 'package:education/View/Components/rateItem.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';

import '../../Manager/Constants.dart';

// ignore: must_be_immutable
class FlashCardItem extends StatelessWidget {
  FlashCardItem({
    super.key,
    required this.frontText,
    required this.backText,
    required this.index,
    required this.flipController,
  });

  final String frontText;
  final String backText;
  final int index;
  final FlipCardController flipController;
  var cardKeys = <int, GlobalKey<FlipCardState>>{};
  GlobalKey<FlipCardState> lastFlipped = GlobalKey<FlipCardState>();

  @override
  Widget build(BuildContext context) {
    cardKeys.putIfAbsent(index, () => GlobalKey<FlipCardState>());
    GlobalKey<FlipCardState>? thisCard = cardKeys[index];
    return FlipCardWithKeepAlive(
      child: FlipCard(
        key: thisCard,
        controller: flipController,
        front: Center(
          child: Container(
            padding: AppPadding.fllowingCard,
            child: Text(
              key: const Key("frontText"),
              frontText,
              style: const TextStyle(fontWeight: FontWeight.bold),
              textScaleFactor: 1.4,
            ),
          ),
        ),
        back: _getBackCardView(context),
        onFlip: () {
          if (lastFlipped != thisCard) {
            lastFlipped.currentState?.toggleCard();
            lastFlipped = thisCard!;
          }
        },
      ),
    );
  }

  Widget _getBackCardView(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: AppPadding.fllowingCard,
              child: Text(
                frontText,
                style: const TextStyle(fontWeight: FontWeight.bold),
                textScaleFactor: 1.2,
              ),
            ),
            Container(
              padding: AppPadding.divider,
              child: Divider(
                color: Theme.of(context).colorScheme.divider,
                thickness: 2,
              ),
            ),
            Container(
              padding: AppPadding.answerPadding,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: AppPadding.bottomOnly5,
                      child: Text(
                        ConstantsMessages.answer,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.answer),
                        textScaleFactor: 1,
                      ),
                    ),
                    Container(
                      padding: AppPadding.bottom30,
                      child: Text(
                        backText,
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Theme.of(context).colorScheme.lightWhite),
                        textScaleFactor: 1.2,
                      ),
                    ),
                    const RateItem(),
                  ]),
            ),
            Container(
              constraints: const BoxConstraints(minHeight: 120),
            )
          ],
        ));
  }
}

class FlipCardWithKeepAlive extends StatefulWidget {
  final FlipCard child;

  const FlipCardWithKeepAlive({super.key, required this.child});

  @override
  State<StatefulWidget> createState() => FlipCardWithKeepAliveState();
}

class FlipCardWithKeepAliveState extends State<FlipCardWithKeepAlive>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }

  @override
  bool get wantKeepAlive => true;
}
