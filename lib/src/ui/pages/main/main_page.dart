import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../user_list_page/user_list_page.dart';
import '../../responsive/Adapt.dart';
import '../../../data/provider/user_list_provider.dart';
import '../../../../generated/l10n.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  UserListProvider? userListProvider;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      userListProvider = Provider.of<UserListProvider>(context, listen: false);
      userListProvider!.getUserList();
    });
  }

  @override
  Widget build(BuildContext context) {
    userListProvider = Provider.of<UserListProvider>(context, listen: true);
    return Scaffold(
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
      body: const UserListPage(),
    );
  }
}
