import 'package:flutter/cupertino.dart';

import '../../domain/models/post_model.dart';
import '../hive/post_hive.dart';
import '../http/find_http.dart';

class PostFromProvider extends ChangeNotifier {
  final postFromHive = PostFromHive();
  final postHttp = PostFromHttp();
  late List<PostModel> _currentPostList = [];

  List<PostModel> get currentPostList => _currentPostList;

  set currentPostList(List<PostModel> value) {
    _currentPostList = value;
    notifyListeners();
  }

  bool _postAreSaved = false;

  bool get postAreSaved => _postAreSaved;

  set postAreSaved(bool value) {
    _postAreSaved = value;
    notifyListeners();
  }

  void getPostListByUserIdFromDB(int userId) async {
    final postList = await postFromHive.getPostListByUserId(userId);

    currentPostList = postList;
    _postAreSaved = true;
    notifyListeners();
  }

  void getPostListByUserIdFromApi(int userId) async {
    final postList = await postHttp.getPostListByUserId(userId);
    currentPostList = postList;
    for (var post in postList) {
      postFromHive.savePost(post);
    }
    _postAreSaved = true;
    notifyListeners();
  }

  void checkIfPostAreSavedFromProvider(userId) async {
    bool postsIsSaved = await postFromHive.checkIfPostAreSaved(userId);
    if (postsIsSaved) {
      getPostListByUserIdFromDB(userId);
    } else {
      getPostListByUserIdFromApi(userId);
    }
  }
}
