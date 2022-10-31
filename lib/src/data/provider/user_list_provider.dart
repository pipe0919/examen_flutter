import 'package:flutter/cupertino.dart';

import '../../domain/models/user_model.dart';

import '../http/user_http.dart';

class UserListProvider extends ChangeNotifier {
  UsersService userService = UsersService();

  late List<UserModel>? _userModelList = [];

  List<UserModel>? get userModelList => _userModelList;

  set userModelList(List<UserModel>? value) {
    _userModelList = value;
    notifyListeners();
  }

  Future<void> getUserList() async {
    List<UserModel> postModelListFromService = await userService.getUserList();

    userModelList = postModelListFromService;

    notifyListeners();
  }
}
