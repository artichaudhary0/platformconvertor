import 'package:flutter/material.dart';
import 'package:platformconvertor/provider/navigatorProvider.dart';
import 'package:platformconvertor/view/contacts_screen.dart';
import 'package:platformconvertor/view/favourite_screen.dart';
import 'package:platformconvertor/view/recent_scren.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var navProvider = Provider.of<NavigatorProvider>(context, listen: false);

    List<Widget> screen = [
      const FavouriteScreen(),
      const RecentScreen(),
      const ContactScreen(),
    ];

    return SafeArea(
      child: Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Consumer<NavigatorProvider>(
              builder: (context, pro, child) {
                return screen[pro.index];
              },
            )),
        bottomNavigationBar: Consumer<NavigatorProvider>(
          builder: (context, pro, child) {
            return BottomNavigationBar(
              backgroundColor: Colors.transparent,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.yellow,
              currentIndex: pro.index,
              onTap: (value) {
                pro.changeValue(value);
                print(pro.index);
              },
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.star_border), label: "Favourites"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.alarm), label: "Recent"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.people), label: "Contacts"),
              ],
            );
          },
        ),
      ),
    );
  }
}
