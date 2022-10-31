import '../models/post_model.dart';

abstract class FindPostRepository {
  Future<List<PostModel>> getPostListByUserId(int userId);
}
