import 'package:examen_flutter/src/domain/models/user_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../domain/repositories/user_repository.dart';
import '../common/const.dart';

class UsersFromHive extends UserRepository {
  @override
  Future<List<UserModel>> getUserList() async {
    final box = await Hive.openBox<UserModel>(Consts.userBoxName);
    return box.values.toList();
  }

  Future<void> saveUser(UserModel user) async {
    final box = await Hive.openBox<UserModel>(Consts.userBoxName);
    await box.add(user);
  }
}
