import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../data/http/find_posts_http.dart';
import '../../../domain/models/post_model.dart';
import '../../colors/colors.dart';
import '../../responsive/Adapt.dart';
import '../../widgets/info_user_text_widget.dart';
import '../../../domain/models/user_model.dart';
import '../../../data/provider/user_list_provider.dart';
import '../info_user_page/post_detail_page.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({Key? key}) : super(key: key);

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  UserListProvider? userProvider;
  final spaceW = Container(
    width: Adapt.wp(5),
  );
  final spaceH = Container(
    height: Adapt.hp(0.5),
  );

  @override
  Widget build(BuildContext context) {
    userProvider = Provider.of<UserListProvider>(context, listen: true);

    return Center(
        child: SizedBox(
      width: Adapt.wp(95),
      child: ListView.separated(
        itemCount: userProvider!.userModelList!.length,
        separatorBuilder: (context, index) => Container(
          height: Adapt.hp(5),
        ),
        itemBuilder: (context, index) => MaterialButton(
          onPressed: () async {
            final findPostService = FindPostService();
            List<PostModel> postList = await findPostService
                .getPostListByUserId(userProvider!.userModelList![index].id);
            // ignore: use_build_context_synchronously
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return PostDetailPage(
                user: userProvider!.userModelList![index],
                postList: postList,
              );
            }));
          },
          child: listPostWidget(userProvider!.userModelList![index]),
        ),
      ),
    ));
  }

  Widget listPostWidget(UserModel user) {
    return Container(
      padding: EdgeInsets.all(Adapt.px(10)),
      height: Adapt.hp(20),
      color: Colors.white,
      child: Column(
        children: [
          spaceH,
          InfoUserText(
            text: user.name,
          ),
          spaceH,
          Row(
            children: [
              const Icon(Icons.email, color: ColorsApp.appColor),
              spaceW,
              InfoUserText(
                text: user.phone,
              ),
            ],
          ),
          spaceH,
          Row(
            children: [
              const Icon(Icons.phone, color: ColorsApp.appColor),
              spaceW,
              InfoUserText(
                text: user.email,
              ),
            ],
          ),
          spaceH,
        ],
      ),
    );
  }
}
