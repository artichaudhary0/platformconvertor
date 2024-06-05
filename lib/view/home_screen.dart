import 'package:flutter/material.dart';
import 'package:platformconvertor/provider/theme_provider.dart';
import 'package:platformconvertor/themes/themes.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    ThemeProvider _themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              color: _themeProvider.getTheme == darkTheme
                  ? Colors.white54
                  : Colors.black,
            ),
            Switch(
                value: _themeProvider.getTheme == darkTheme,
                activeColor: _themeProvider.getTheme == darkTheme
                    ? Colors.white54
                    : Colors.black,
                onChanged: (v) {
                  _themeProvider.changeTheme();
                })
          ],
        ),
      ),
    );
  }
}
