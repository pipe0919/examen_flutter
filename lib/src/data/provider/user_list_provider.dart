import 'package:flutter/cupertino.dart';

import '../../domain/models/user_model.dart';

import '../hive/user_hive.dart';
import '../http/user_http.dart';

class UserListProvider extends ChangeNotifier {
  UsersService userService = UsersService();

  late List<UserModel>? _userModelList = [];

  List<UserModel>? get userModelList => _userModelList;

  set userModelList(List<UserModel>? value) {
    _userModelList = value;
    notifyListeners();
  }

  bool _userAreSaved = false;

  bool get userAreSaved => _userAreSaved;

  set userAreSaved(bool value) {
    _userAreSaved = value;
    notifyListeners();
  }

  Future<void> getUserList() async {
    List<UserModel> postModelListFromService = await userService.getUserList();
    userModelList = postModelListFromService;
    userAreSaved = true;
    notifyListeners();
  }

  void checkIfUsersAreSaved() async {
    UsersFromHive usersFromHive = UsersFromHive();
    List<UserModel> usersFromDB = await usersFromHive.getUserList();

    if (usersFromDB.isNotEmpty) {
      userModelList = usersFromDB;
      userAreSaved = true;
    } else {
      getUserList();
    }
  }
}
