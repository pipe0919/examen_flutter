import 'package:flutter/cupertino.dart';

import '../../domain/models/user_model.dart';

import '../hive/user_hive.dart';
import '../http/user_http.dart';

class UserFromProvider extends ChangeNotifier {
  UserFromHttp userFromHttp = UserFromHttp();
  UserFromHive userFromHive = UserFromHive();

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
    List<UserModel> userModelListFormService = await userFromHttp.getUserList();
    for (var user in userModelListFormService) {
      userFromHive.saveUser(user);
    }
    userModelList = userModelListFormService;
    userAreSaved = true;
    notifyListeners();
  }

  void checkIfUsersAreSaved() async {
    List<UserModel> usersFromDB = await userFromHive.getUserList();

    if (usersFromDB.isNotEmpty) {
      userModelList = usersFromDB;
      userAreSaved = true;
    } else {
      getUserList();
    }
  }

  List<UserModel>? listaFiltrada(String query) {
    List<UserModel>? listaFiltrada = userModelList!.where((user) {
      return user.name.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return listaFiltrada;
  }
}
