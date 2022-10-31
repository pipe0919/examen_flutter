import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../colors/colors.dart';
import '../../responsive/Adapt.dart';
import '../../widgets/const_widgets.dart';
import '../../widgets/info_user_text_widget.dart';
import '../../../domain/models/user_model.dart';
import '../../../data/provider/user_provider.dart';
import 'post_list_controller.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({Key? key}) : super(key: key);

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  PostListController postListController = PostListController();
  UserFromProvider? userProvider;

  @override
  Widget build(BuildContext context) {
    userProvider = Provider.of<UserFromProvider>(context, listen: true);

    return userProvider!.userModelList!.isEmpty
        ? noInternetWidget()
        : Center(
            child: SizedBox(
            width: Adapt.wp(95),
            child: ListView.separated(
              itemCount: userProvider!.userModelList!.length,
              separatorBuilder: (context, index) => Container(
                height: Adapt.hp(5),
              ),
              itemBuilder: (context, index) => MaterialButton(
                onPressed: () => postListController.goToInfoUserAndListPost(
                    userProvider!.userModelList![index], context),
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
          ConstsWidget.spaceH,
          InfoUserText(
            text: user.name,
          ),
          ConstsWidget.spaceH,
          Row(
            children: [
              const Icon(Icons.email, color: ColorsApp.appColor),
              ConstsWidget.spaceW,
              InfoUserText(
                text: user.phone,
              ),
            ],
          ),
          ConstsWidget.spaceH,
          Row(
            children: [
              const Icon(Icons.phone, color: ColorsApp.appColor),
              ConstsWidget.spaceW,
              InfoUserText(
                text: user.email,
              ),
            ],
          ),
          ConstsWidget.spaceH,
        ],
      ),
    );
  }

  Widget noInternetWidget() {
    return Container(
      alignment: Alignment.center,
      color: Colors.white,
      child: Text('no hay usuarios en el momento, intente mas tarde'),
    );
  }
}
