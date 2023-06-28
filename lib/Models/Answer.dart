import 'ForYou.dart';

class Answer {
  Answer({
    required this.id,
    // ignore: non_constant_identifier_names
    required this.correct_options,
  });

  int id;
  // ignore: non_constant_identifier_names
  List<Option> correct_options;

  factory Answer.fromJson(Map<String, dynamic> json) => Answer(
        id: json["id"],
        correct_options: getOptions(json["correct_options"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user": getOptionsJSON(correct_options),
      };
}
