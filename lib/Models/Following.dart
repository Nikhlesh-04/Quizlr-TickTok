class Following {
  Following({
    required this.type,
    required this.id,
    required this.playlist,
    // ignore: non_constant_identifier_names
    required this.flashcard_front,
    // ignore: non_constant_identifier_names
    required this.flashcard_back,
    required this.description,
    required this.user,
  });

  String type;
  int id;
  String playlist;
  // ignore: non_constant_identifier_names
  String flashcard_front;
  // ignore: non_constant_identifier_names
  String flashcard_back;
  String description;
  User user;

  factory Following.fromJson(Map<String, dynamic> json) => Following(
        type: json["type"],
        id: json["id"],
        playlist: json["playlist"],
        flashcard_front: json["flashcard_front"],
        flashcard_back: json["flashcard_back"],
        description: json["description"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "id": id,
        "playlist": playlist,
        "flashcard_front": flashcard_front,
        "flashcard_back": flashcard_back,
        "description": description,
        "user": user.toJson(),
      };
}

class User {
  User({
    required this.name,
    required this.avatar,
  });

  String name;
  String avatar;

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        avatar: json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "avatar": avatar,
      };
}
