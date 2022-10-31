import 'package:flutter/material.dart';

import '../../../domain/models/post_model.dart';
import '../../../domain/models/user_model.dart';
import '../../responsive/Adapt.dart';

class PostDetailController {
  Widget esLoading(bool ready, UserModel user, List<PostModel> postList) {
    if (ready) {
      return listViewOfPosts(postList);
    } else {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
  }

  Widget listViewOfPosts(List<PostModel> postList) {
    return postList.isEmpty
        ? noInternetWidget()
        : ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  height: Adapt.hp(25),
                  width: Adapt.wp(80),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: Adapt.px(10), right: Adapt.px(10)),
                    child: Text(
                      postList[index].title,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: Adapt.px(24),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            separatorBuilder: (context, index) => Container(
              height: Adapt.hp(0.15),
              color: Colors.grey,
            ),
            itemCount: postList.length,
          );
  }

  Widget noInternetWidget() {
    return Container(
      alignment: Alignment.center,
      color: Colors.white,
      child: Text('No hay post en el momento, por favor intentalo mas tarde'),
    );
  }
}
