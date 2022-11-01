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
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    userProvider = Provider.of<UserFromProvider>(context, listen: true);

    return Center(
        child: SizedBox(
      width: Adapt.wp(95),
      child: Column(
        children: [
          Container(
            height: Adapt.hp(1),
          ),
          TextField(
            controller: searchController,
            decoration: const InputDecoration(
              hintText: 'Search',
              prefixIcon: Icon(Icons.search),
            ),
            onChanged: (value) {
              setState(() {});
            },
          ),
          Container(
            height: Adapt.hp(3),
          ),
          userProvider!.listaFiltrada(searchController.text)!.isEmpty
              ? ConstsWidget.emptyListWidget()
              : SizedBox(
                  height: Adapt.hp(78),
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: userProvider!
                        .listaFiltrada(searchController.text)!
                        .length,
                    separatorBuilder: (context, index) => Container(
                      height: Adapt.hp(5),
                    ),
                    itemBuilder: (context, index) => MaterialButton(
                      onPressed: () =>
                          postListController.goToInfoUserAndListPost(
                              userProvider!.userModelList![index], context),
                      child: listPostWidget(userProvider!
                          .listaFiltrada(searchController.text)![index]),
                    ),
                  ),
                ),
        ],
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
}
