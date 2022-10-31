import 'package:http/http.dart' as http;

import 'dart:convert';

import '../enviroment/environment.dart';

import '../../domain/models/post_model.dart';
import '../../domain/repositories/find_post_repository.dart';

class FindPostService extends FindPostRepository {
  @override
  Future<List<PostModel>> getPostListByUserId(int userId) async {
    List<PostModel> postslList = [];
    String url = '${Env.findPostUrl}$userId';

    final response = await http.get(
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      for (var post in jsonResponse) {
        postslList.add(PostModel.fromJson(post));
      }
      return postslList;
    } else {
      return [];
    }
  }
}
