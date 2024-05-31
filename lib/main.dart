import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:platformconvertor/provider/increment_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (_) => IncrementProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const BoilerPlateCode(),
      ),
    );
  }
}

class BoilerPlateCode extends StatefulWidget {
  const BoilerPlateCode({super.key});

  @override
  State<BoilerPlateCode> createState() => _BoilerPlateCodeState();
}

class _BoilerPlateCodeState extends State<BoilerPlateCode> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<IncrementProvider>(context, listen: false);
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
            })
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
