import 'package:http/http.dart' as http;

import 'dart:convert';
import '../../domain/repositories/user_repository.dart';
import '../enviroment/environment.dart';

import '../../domain/models/user_model.dart';

class UserFromHttp extends UserRepository {
  @override
  Future<List<UserModel>> getUserList() async {
    List<UserModel> userModelList = [];
    String url = Env.findUsers;
    try {
      final response = await http.get(
        Uri.parse(url),
      );

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        for (var user in jsonResponse) {
          userModelList.add(UserModel.fromJson(user));
        }
        return userModelList;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}
