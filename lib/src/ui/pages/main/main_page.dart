import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../responsive/Adapt.dart';
import '../../../data/provider/user_provider.dart';
import '../../../../generated/l10n.dart';
import 'main_page_controller.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  UserFromProvider? userListProvider;
  MainPageController mainPageController = MainPageController();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      userListProvider = Provider.of<UserFromProvider>(context, listen: false);
      userListProvider!.checkIfUsersAreSaved();
    });
  }

  @override
  Widget build(BuildContext context) {
    userListProvider = Provider.of<UserFromProvider>(context, listen: true);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(255, 218, 218, 218),
      appBar: AppBar(
        title: Text(
          S.current.user,
          style: TextStyle(
            fontSize: Adapt.px(35),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: mainPageController.esLoading(userListProvider!.userAreSaved),
    );
  }
}
