import 'HTTPMethod.dart';

// ignore: file_names
abstract class APIRequirement {
  String get baseURL;
  Map<String, String> get apiHeader;

  Future<T> request<T, K>(
      HTTPMethod method, String? urlParameter, Map<String, dynamic> paramaters);
}
