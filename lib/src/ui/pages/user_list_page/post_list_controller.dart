import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/provider/post_provider.dart';

import '../../../domain/models/user_model.dart';

import '../info_user_page/post_detail_page.dart';

class PostListController {
  void goToInfoUserAndListPost(UserModel user, context) async {
    FocusScope.of(context).unfocus();
    PostFromProvider findPostProvider =
        Provider.of<PostFromProvider>(context, listen: false);

    findPostProvider.checkIfPostAreSavedFromProvider(user.id);

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return PostDetailPage(
        user: user,
      );
    }));
  }
}
