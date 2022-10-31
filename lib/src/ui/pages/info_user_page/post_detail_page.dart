import 'package:flutter/material.dart';

import '../../../domain/models/post_model.dart';
import '../../../domain/models/user_model.dart';
import '../../../../generated/l10n.dart';
import '../../responsive/Adapt.dart';
import '../../widgets/info_user_text_widget.dart';
import '../../widgets/titlle_text_widget.dart';

// ignore: must_be_immutable
class PostDetailPage extends StatelessWidget {
  PostDetailPage({
    super.key,
    required this.user,
    required this.postList,
  });
  final spaceHeight = SizedBox(
    height: Adapt.hp(1),
  );
  List<PostModel> postList;
  UserModel user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Text(
          S.current.post,
          style: TextStyle(
            fontSize: Adapt.px(40),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
              child: Column(
            children: [
              spaceHeight,
              TittleText(text: S.current.user),
              spaceHeight,
              InfoUserText(text: '${S.current.name}: ${user.name}'),
              InfoUserText(text: '${S.current.email}: ${user.email}'),
              InfoUserText(text: '${S.current.phone}: ${user.phone}'),
              spaceHeight,
              spaceHeight,
              Container(
                height: Adapt.hp(6),
                color: const Color.fromARGB(255, 207, 205, 205),
                alignment: Alignment.centerLeft,
                child: TittleText(text: S.current.posts),
              ),
              spaceHeight,
              listViewOfPosts(),
            ],
          )),
        ),
      ),
    );
  }

  Widget listViewOfPosts() {
    return ListView.separated(
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
              padding: EdgeInsets.only(left: Adapt.px(10), right: Adapt.px(10)),
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
}
