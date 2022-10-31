import 'package:examen_flutter/src/domain/models/post_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../domain/repositories/post_repository.dart';
import '../common/const.dart';

class PostFromHive extends PostRepository {
  @override
  Future<List<PostModel>> getPostListByUserId(int userId) async {
    final box = await Hive.openBox<PostModel>(Consts.postBoxName);

    List<PostModel> postListAux = [];
    for (var element in box.values.toList()) {
      if (element.userId == userId) {
        postListAux.add(element);
      }
    }

    return postListAux;
  }

  Future<bool> checkIfPostAreSaved(userId) async {
    final box = await Hive.openBox<PostModel>(Consts.postBoxName);

    List<PostModel> postListAux = [];
    for (var element in box.values.toList()) {
      if (element.userId == userId) {
        postListAux.add(element);
      }
    }
    if (postListAux.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> savePost(PostModel post) async {
    final box = await Hive.openBox<PostModel>(Consts.postBoxName);
    await box.add(post);
  }
}
