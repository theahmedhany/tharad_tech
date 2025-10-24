import 'package:hive_flutter/hive_flutter.dart';

import '../models/user_details_model.dart';

class HiveService {
  static const String userBoxName = 'userDetailsBox';

  static Future<void> init() async {
    await Hive.initFlutter();
    HiveAdapters.registerAdapters();
    await Hive.openBox<UserDetailsModel>(userBoxName);
  }

  static Future<void> cacheUserDetails(UserDetailsModel user) async {
    final box = Hive.box<UserDetailsModel>(userBoxName);
    await box.put('cachedUser', user);
  }

  static UserDetailsModel? getCachedUserDetails() {
    final box = Hive.box<UserDetailsModel>(userBoxName);
    return box.get('cachedUser');
  }

  static Future<void> clearCachedUserDetails() async {
    final box = Hive.box<UserDetailsModel>(userBoxName);
    await box.delete('cachedUser');
  }
}

class HiveAdapters {
  static void registerAdapters() {
    Hive.registerAdapter(UserDetailsModelAdapter());
    Hive.registerAdapter(UserDataAdapter());
  }
}
