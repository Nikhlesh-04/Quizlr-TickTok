import 'Following.dart';

class ForYou {
  ForYou({
    required this.type,
    required this.id,
    required this.playlist,
    required this.description,
    required this.image,
    required this.question,
    required this.options,
    required this.user,
  });

  String type;
  int id;
  String playlist;
  String description;
  String image;
  String question;
  List<Option> options;
  User user;

  factory ForYou.fromJson(Map<String, dynamic> json) => ForYou(
        type: json["type"],
        id: json["id"],
        playlist: json["playlist"],
        description: json["description"],
        image: json["image"],
        question: json["question"],
        options: getOptions(json["options"]),
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "id": id,
        "playlist": playlist,
        "description": description,
        "image": image,
        "question": question,
        "options": getOptionsJSON(options),
        "user": user.toJson(),
      };
}

class Option {
  Option({
    required this.id,
    required this.answer,
  });

  String id;
  String answer;

  factory Option.fromJson(Map<String, dynamic> json) => Option(
        id: json["id"],
        answer: json["answer"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "answer": answer,
      };
}

List<Option> getOptions(dynamic json) {
  List<Option> listArray = [];
  if (json is Iterable) {
    for (var element in json) {
      listArray.add(Option.fromJson(element));
    }
  }
  return listArray;
}

List<Map<String, dynamic>> getOptionsJSON(List<Option> array) {
  List<Map<String, dynamic>> listArray = [];
  for (var element in array) {
    listArray.add(element.toJson());
  }
  return listArray;
}
