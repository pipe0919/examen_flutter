import 'package:flutter/material.dart';

import '../user_list_page/user_list_page.dart';

class MainPageController {
  Widget esLoading(bool ready) {
    if (ready) {
      return const UserListPage();
    } else {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}
