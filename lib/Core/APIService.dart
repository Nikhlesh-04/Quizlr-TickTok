import 'package:education/Models/Answer.dart';
import '../Models/Following.dart';
import '../Models/ForYou.dart';
import 'DataServiceManager.dart';
import 'Networking/HTTPMethod.dart';
import 'Networking/API.dart';

class APIService extends DataServiceManager {
  @override
  Future<Following> getFollowing() async {
    final response = API(MethodPath.following)
        .request<Following, void>(HTTPMethod.get, null, null);
    return response;
  }

  @override
  Future<ForYou> getForYou() async {
    final response = API(MethodPath.forYou)
        .request<ForYou, void>(HTTPMethod.get, null, null);
    return response;
  }

  @override
  Future<Answer> getAnswer(String id) async {
    final response =
        API(MethodPath.answers).request<Answer, void>(HTTPMethod.get, id, null);
    return response;
  }
}
