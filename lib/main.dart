import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:platformconvertor/provider/navigatorProvider.dart';
import 'package:platformconvertor/provider/theme_provider.dart';

import 'package:platformconvertor/view/home_screen.dart';
import 'package:platformconvertor/view/main_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences pref = await SharedPreferences.getInstance();
  bool themeVar = pref.getBool("isDark") ?? false;

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => ThemeProvider(isDark: themeVar),
      ),
      ChangeNotifierProvider(
        create: (_) => NavigatorProvider(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, value, child) {
      return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: value.getTheme,
        home: const MainScreen(),
      );
    });
  }
}
