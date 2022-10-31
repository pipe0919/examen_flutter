import 'generated/l10n.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'src/data/provider/post_provider.dart';
import 'src/data/provider/user_provider.dart';

import 'src/domain/models/post_model.dart';
import 'src/domain/models/user_model.dart';

import 'src/ui/pages/main/main_page.dart';
import 'src/ui/theme/app_themes.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());
  Hive.registerAdapter(PostModelAdapter());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserFromProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => PostFromProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Examen Flutter',
        debugShowCheckedModeBanner: false,
        theme: AppThemes.themeData,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        home: const MainPage(),
      ),
    );
  }
}
