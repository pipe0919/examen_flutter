import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'generated/l10n.dart';
import 'src/data/provider/user_list_provider.dart';
import 'src/ui/pages/main/main_page.dart';
import 'src/ui/theme/app_themes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserListProvider(),
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
