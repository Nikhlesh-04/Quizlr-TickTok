// ignore: file_names
import 'dart:convert';
import '../../Manager/Constants.dart';
import '../GenericModels.dart';
import 'APIRequirement.dart';
import 'HTTPMethod.dart';
import 'package:http/http.dart' as http;

enum MethodPath { following, forYou, answers }

extension MethodPathString on MethodPath {
  String get urlString {
    switch (this) {
      case MethodPath.following:
        return 'following';
      case MethodPath.forYou:
        return 'for_you';
      case MethodPath.answers:
        return 'reveal?id=';
    }
  }
}

class API extends APIRequirement {
  final MethodPath methodPath;
  API(this.methodPath);

  @override
  Map<String, String> get apiHeader => Constants.kHeaders;

  @override
  String get baseURL => ApiURLs.baseURL;

  @override
  Future<T> request<T, K>(HTTPMethod method, String? urlParameter,
      Map<String, dynamic>? paramaters) async {
    var urlString = baseURL + methodPath.urlString;

    if (method == HTTPMethod.get && urlParameter != null) {
      urlString += urlParameter;
    }

    print('\n**** Request method: ${method.toString()}, $urlString\n');

    dynamic body;
    if (paramaters != null) {
      //encode Map to JSON
      body = json.encode(paramaters);
      print("\n**** Parameters: $paramaters\n");
    }

    var uri = Uri.parse(urlString);

    if ((method == HTTPMethod.get || method == HTTPMethod.delete) &&
        paramaters != null) {
      uri = uri.replace(queryParameters: paramaters);
    }

    // MARK:- HeaderField
    var finalHeaders = apiHeader;

    switch (method) {
      case HTTPMethod.get:
        final finalUri = uri.replace(queryParameters: paramaters);
        final response = await http
            .get(
          finalUri,
          headers: finalHeaders,
        )
            .timeout(
          const Duration(seconds: ApiConstants.apiTimeoutTime),
          onTimeout: () {
            // Time has run out, do what you wanted to do.
            return http.Response(
                'Error', 408); // Request Timeout response status code
          },
        );

        if (response.statusCode == 200 || response.statusCode == 201) {
          // If the call to the server was successful, parse the JSON
          final responses = Generic.fromJson<T, K>(json.decode(response.body));
          print("\n**** Response: $responses\n");
          return responses;
        } else {
          var responseJson = json.decode(response.body.toString());
          print("\n**** Response: $responseJson\n");
          // If that call was not successful, throw an error.
          throw Exception('Failed to get response of: $finalUri');
        }
      case HTTPMethod.post:
        final finalUri = uri.replace(queryParameters: paramaters);
        final response = await http
            .post(
          finalUri,
          headers: finalHeaders,
          body: body,
        )
            .timeout(
          const Duration(seconds: ApiConstants.apiTimeoutTime),
          onTimeout: () {
            // Time has run out, do what you wanted to do.
            return http.Response(
                'Error', 408); // Request Timeout response status code
          },
        );
        if (response.statusCode == 200 || response.statusCode == 201) {
          // If the call to the server was successful, parse the JSON
          final responses = Generic.fromJson<T, K>(json.decode(response.body));
          print("\n**** Response: $responses\n");
          return responses;
        } else {
          var responseJson = json.decode(response.body.toString());
          print("\n**** Response: $responseJson\n");
          // If that call was not successful, throw an error.
          throw Exception('Failed to get response of: $finalUri');
        }
      case HTTPMethod.put:
        final finalUri = uri.replace(queryParameters: paramaters);
        final response = await http
            .put(
          finalUri,
          headers: finalHeaders,
          body: body,
        )
            .timeout(
          const Duration(seconds: ApiConstants.apiTimeoutTime),
          onTimeout: () {
            // Time has run out, do what you wanted to do.
            return http.Response(
                'Error', 408); // Request Timeout response status code
          },
        );
        if (response.statusCode == 200 || response.statusCode == 201) {
          // If the call to the server was successful, parse the JSON
          final responses = Generic.fromJson<T, K>(json.decode(response.body));
          print("\n**** Response: $responses\n");
          return responses;
        } else {
          var responseJson = json.decode(response.body.toString());
          print("\n**** Response: $responseJson\n");
          // If that call was not successful, throw an error.
          throw Exception('Failed to get response of: $finalUri');
        }
      case HTTPMethod.patch:
        final finalUri = uri.replace(queryParameters: paramaters);
        final response = await http
            .patch(
          finalUri,
          headers: finalHeaders,
          body: body,
        )
            .timeout(
          const Duration(seconds: ApiConstants.apiTimeoutTime),
          onTimeout: () {
            // Time has run out, do what you wanted to do.
            return http.Response(
                'Error', 408); // Request Timeout response status code
          },
        );
        if (response.statusCode == 200 || response.statusCode == 201) {
          // If the call to the server was successful, parse the JSON
          final responses = Generic.fromJson<T, K>(json.decode(response.body));
          print("\n**** Response: $responses\n");
          return responses;
        } else {
          var responseJson = json.decode(response.body.toString());
          print("\n**** Response: $responseJson\n");
          // If that call was not successful, throw an error.
          throw Exception('Failed to get response of: $finalUri');
        }
      case HTTPMethod.delete:
        final finalUri = uri.replace(queryParameters: paramaters);
        final response = await http
            .delete(
          finalUri,
          headers: finalHeaders,
          body: body,
        )
            .timeout(
          const Duration(seconds: ApiConstants.apiTimeoutTime),
          onTimeout: () {
            // Time has run out, do what you wanted to do.
            return http.Response(
                'Error', 408); // Request Timeout response status code
          },
        );
        if (response.statusCode == 200 || response.statusCode == 201) {
          // If the call to the server was successful, parse the JSON
          final responses = Generic.fromJson<T, K>(json.decode(response.body));
          print("\n**** Response: $responses\n");
          return responses;
        } else {
          var responseJson = json.decode(response.body.toString());
          print("\n**** Response: $responseJson\n");
          // If that call was not successful, throw an error.
          throw Exception('Failed to get response of: $finalUri');
        }
    }
  }
}
