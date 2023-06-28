import '../Models/Answer.dart';
import '../Models/Following.dart';
import '../Models/ForYou.dart';
import 'APIService.dart';

abstract class DataServiceManager {
  Future<Following> getFollowing();
  Future<ForYou> getForYou();
  Future<Answer> getAnswer(String id);
}

// our DataManager class knows nothing about how how data is comming from works.
// Here we only need to change manager intance to get data whenever class who implemets DataServiceManager abstraction.
class DataManager {
  static final manager = APIService();

  // static Future<Following> getFollowing(DataServiceManager manager) {
  //   return manager.getFollowing();
  // }

  static Future<Following> getFollowing() {
    return manager.getFollowing();
  }

  static Future<ForYou> getForYou() {
    return manager.getForYou();
  }

  static Future<Answer> getAnswer(String id) {
    return manager.getAnswer(id);
  }
}
