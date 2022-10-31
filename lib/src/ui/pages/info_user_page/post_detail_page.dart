import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/provider/post_provider.dart';
import '../../../domain/models/user_model.dart';
import '../../../../generated/l10n.dart';
import '../../responsive/Adapt.dart';
import '../../widgets/info_user_text_widget.dart';
import '../../widgets/titlle_text_widget.dart';
import 'post_detail_controller.dart';

class PostDetailPage extends StatefulWidget {
  PostDetailPage({
    super.key,
    required this.user,
  });

  UserModel user;

  @override
  State<PostDetailPage> createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  PostDetailController postDetailController = PostDetailController();
  final spaceHeight = SizedBox(
    height: Adapt.hp(1),
  );

  @override
  Widget build(BuildContext context) {
    PostFromProvider findPostProvider =
        Provider.of<PostFromProvider>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context, false);
            findPostProvider.postAreSaved = false;
          },
        ),
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
              InfoUserText(text: '${S.current.name}: ${widget.user.name}'),
              InfoUserText(text: '${S.current.email}: ${widget.user.email}'),
              InfoUserText(text: '${S.current.phone}: ${widget.user.phone}'),
              spaceHeight,
              spaceHeight,
              Container(
                height: Adapt.hp(6),
                color: const Color.fromARGB(255, 207, 205, 205),
                alignment: Alignment.centerLeft,
                child: TittleText(text: S.current.posts),
              ),
              spaceHeight,
              postDetailController.esLoading(findPostProvider.postAreSaved,
                  widget.user, findPostProvider.currentPostList),
            ],
          )),
        ),
      ),
    );
  }
}
