import 'package:education/Manager/ColourStyle.dart';
import 'package:flutter/foundation.dart';
import 'package:rounded_background_text/rounded_background_text.dart';
import 'package:education/Manager/Padding.dart';
import 'package:flutter/material.dart';
import '../../Manager/Constants.dart';
import '../../Models/ForYou.dart';

class McqQuestionItem extends StatelessWidget {
  const McqQuestionItem(
      {super.key,
      required this.questionText,
      required this.options,
      required this.answerID,
      required this.selectedIndex,
      required this.ontapItem});

  final String questionText;
  final List<Option> options;
  final String answerID;
  final ValueChanged<int> ontapItem;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RoundedBackgroundText(
          key: const Key("question"),
          questionText,
          backgroundColor: Theme.of(context).colorScheme.mcqTitle,
          style: TextStyle(
              color: Theme.of(context).colorScheme.label,
              fontWeight: FontWeight.w700,
              fontSize: 18.0,
              height: 1.6),
        ),
        const Spacer(),
        ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            key: const Key('question_table_view'),
            itemCount: options.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                child: Card(
                  key: Key("$index Cell"),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  color: _getCardColour(context, index),
                  child: Container(
                    padding: AppPadding.all20,
                    child: Text(
                      options[index].answer,
                      style: const TextStyle(shadows: [
                        Shadow(
                          offset: Offset(2.0, 2.0),
                          blurRadius: 3.0,
                          color: Colors.black,
                        )
                      ]),
                    ),
                  ),
                ),
                onTap: () {
                  if (kDebugMode) {
                    print(index);
                  }
                  _showToast(context, index);
                  ontapItem(index);
                },
              );
            })
      ],
    );
  }

  Color _getCardColour(BuildContext context, int index) {
    if (selectedIndex == index && selectedIndex > -1) {
      if (selectedIndex == index && options[selectedIndex].id == answerID) {
        return Theme.of(context).colorScheme.correctAnswer;
      } else {
        return Theme.of(context).colorScheme.wrongAnswer;
      }
    } else {
      return Theme.of(context).colorScheme.optionBackground;
    }
  }

  void _showToast(BuildContext context, int index) {
    String text = '';
    bool isCorrect = false;
    if (index > -1) {
      if (options[index].id == answerID) {
        text = ConstantsMessages.correctAnswer;
        isCorrect = true;
      } else {
        isCorrect = false;
        text = ConstantsMessages.wrongAnswer;
      }
    } else {
      isCorrect = false;
      text = '';
    }
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        backgroundColor: isCorrect
            ? Theme.of(context).colorScheme.correctAnswer
            : Theme.of(context).colorScheme.wrongAnswer,
        duration: const Duration(milliseconds: 160),
        content: Text(text),
      ),
    );
  }
}
