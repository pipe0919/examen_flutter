import 'package:examen_flutter/src/domain/models/post_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../domain/repositories/find_post_repository.dart';
import '../common/const.dart';

class PostFromHive extends FindPostRepository {
  @override
  Future<List<PostModel>> getPostListByUserId(int userId) async {
    final box = await Hive.openBox<PostModel>(Consts.postBoxName);
    return box.values.toList();
  }
}
