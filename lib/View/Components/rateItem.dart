import 'package:education/Manager/ColourStyle.dart';
import 'package:education/Manager/Padding.dart';
import 'package:flutter/material.dart';

import '../../Manager/Constants.dart';

class RateItem extends StatelessWidget {
  const RateItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        padding: AppPadding.bottomOnly5,
        child: Text(
          ConstantsMessages.ratingHeader,
          style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.normal,
              color: Theme.of(context).colorScheme.lightWhite),
        ),
      ),
      Row(
        children: [
          Container(
              padding: AppPadding.rightOnly8,
              child: _getButton(
                  context, Theme.of(context).colorScheme.orange, "1")),
          Container(
              padding: AppPadding.rightOnly8,
              child: _getButton(
                  context, Theme.of(context).colorScheme.lightOrange, "2")),
          Container(
              padding: AppPadding.rightOnly8,
              child: _getButton(
                  context, Theme.of(context).colorScheme.yellow, "3")),
          Container(
              padding: AppPadding.rightOnly8,
              child: _getButton(
                  context, Theme.of(context).colorScheme.darkGreen, "4")),
          Container(
              padding: AppPadding.rightOnly8,
              child:
                  _getButton(context, Theme.of(context).colorScheme.teal, "5")),
        ],
      )
    ]);
  }

  Widget _getButton(BuildContext context, Color colour, String text) {
    return AnimatedContainer(
      duration: const Duration(seconds: 2),
      width: 45,
      height: 45,
      child: TextButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(colour),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      side: BorderSide(color: colour)))),
          onPressed: () {},
          child: Text(text.toUpperCase(),
              style: const TextStyle(fontSize: 14, color: Colors.white))),
    );
  }
}
