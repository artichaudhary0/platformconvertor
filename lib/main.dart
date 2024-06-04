import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:platformconvertor/provider/increment_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => IncrementProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => SwitchProvider(),
        ),
      ],
      child: Consumer<SwitchProvider>(
        builder: (context,pro,child){
          return MaterialApp(
            title: 'Flutter Demo',
            themeMode: themeVar ? ThemeMode.dark : ThemeMode.light,
            theme: ThemeData(
                brightness: Brightness.light
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
            ),
            home: const BoilerPlateCode(),
          );
        },
      ),
    );
  }
}

bool themeVar = true;

class BoilerPlateCode extends StatefulWidget {
  const BoilerPlateCode({super.key});

  @override
  State<BoilerPlateCode> createState() => _BoilerPlateCodeState();
}

class _BoilerPlateCodeState extends State<BoilerPlateCode> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<IncrementProvider>(context, listen: false);
    var provider2 = Provider.of<SwitchProvider>(context, listen: false);
    log("build");
    log("build method");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter demo"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("You have pressed button this many time"),
            Consumer<IncrementProvider>(builder: (context, pro, child) {
              return Text("${pro.increment}");
            }),
            Consumer<SwitchProvider>(
              builder: (context, pro, child) {
                return Switch(
                    value: pro.isDark,
                    onChanged: (value) {
                      provider2.toggle(value);
                    });
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          provider.incrementValue();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}