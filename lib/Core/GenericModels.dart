/*
If for example you would expect the response to be a Message, you would call _getRequest<Message, void>(). If you would expect a list of Messages, you would call _getRequest<List<Message>, Message>().
*/

import 'package:education/Models/Answer.dart';

import '../Models/Following.dart';
import '../Models/ForYou.dart';

class Generic {
  /// If T is a List, K is the subtype of the list.
  static T fromJson<T, K>(dynamic json) {
    if (json is Iterable) {
      var model = json as List<dynamic>;
      return _fromJsonList<K>(model) as T;
    } else if (T == Following) {
      return Following.fromJson(json) as T;
    } else if (T == ForYou) {
      return ForYou.fromJson(json) as T;
    } else if (T == Answer) {
      return Answer.fromJson(json) as T;
    } else if (T == bool || T == String || T == int || T == double) {
      // primitives
      return json;
    } else {
      throw Exception("Unknown class");
    }
  }

  static List<K>? _fromJsonList<K>(List<dynamic> jsonList) {
    return jsonList.map<K>((dynamic json) => fromJson<K, void>(json)).toList();
  }
}
