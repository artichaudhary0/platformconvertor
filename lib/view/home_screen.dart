import 'package:flutter/material.dart';
import 'package:platformconvertor/provider/theme_provider.dart';
import 'package:platformconvertor/themes/themes.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  browser({required String browserLink})async{
    Uri uri = Uri(
      scheme: "https",
      path: browserLink,);
    await launchUrl(uri);
  }
  sms({required String smsPath})async
  {
    Uri uri = Uri(
      scheme: "sms",
      path: smsPath
    );
    await launchUrl(uri);
  }
  mail({required String mailPath})async{
    Uri uri = Uri(
      scheme: "mailto",
      path: mailPath,
    );
    await launchUrl(uri);
  }
  TextEditingController phoneController  = TextEditingController();


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

            CircleAvatar(backgroundColor: Colors.white54,radius: 60,),
            Text("Arti chudhary",style: TextStyle(fontSize: 24),),
            Text("707823956"),
             TextField(
              controller: phoneController,
              decoration: InputDecoration(
              ),
              keyboardType: TextInputType.number,

            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    browser(browserLink: 'https://pub.dev/packages/url_launcher');
                  },
                  child: const Icon(Icons.chrome_reader_mode),
                ),


                FloatingActionButton(
                  onPressed: ()  async{
                    sms(smsPath: phoneController.text);
                    SharedPreferences pref = await SharedPreferences.getInstance();
                    pref.setString("arti", phoneController.text);
                  },
                  child: const Icon(Icons.phone),
                ),

                FloatingActionButton(
                  onPressed: () {
                    mail(mailPath: "im.jagriti.jha@gmail.com");
                  },
                  child: const Icon(Icons.mail),
                ),
              ],
            ),

            Text("${phoneController.text}"),
            // Container(
            //   height: 100,
            //   width: 100,
            //   color: _themeProvider.getTheme == darkTheme
            //       ? Colors.white54
            //       : Colors.black,
            // ),
            // Switch(
            //     value: _themeProvider.getTheme == darkTheme,
            //     activeColor: _themeProvider.getTheme == darkTheme
            //         ? Colors.white54
            //         : Colors.black,
            //     onChanged: (v) {
            //       _themeProvider.changeTheme();
            //     }),
            // Expanded(
            //   child: TextField(
            //     controller: phoneController,
            //     decoration: InputDecoration(
            //     ),
            //     keyboardType: TextInputType.number,
            //
            //   ),
            // ),
            // Row(
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     FloatingActionButton(
            //       onPressed: () {
            //         browser(browserLink: 'https://pub.dev/packages/url_launcher');
            //       },
            //       child: const Icon(Icons.chrome_reader_mode),
            //     ),
            //
            //
            //     FloatingActionButton(
            //       onPressed: ()  {
            //         sms(smsPath: phoneController.value.text);
            //       },
            //       child: const Icon(Icons.phone),
            //     ),
            //
            //     FloatingActionButton(
            //       onPressed: () {
            //         mail(mailPath: "im.jagriti.jha@gmail.com");
            //       },
            //       child: const Icon(Icons.mail),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
