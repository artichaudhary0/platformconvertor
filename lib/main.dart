import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                height: 400,
                width: 600,
                child: Stepper(
                    onStepContinue: (){
                     if(_currentIndex<3)
                       {
                         setState(() {
                           _currentIndex  += 1 ;
                         });
                       }
                    },
                    onStepCancel: (){
                
                      if(_currentIndex>0)
                      {
                        setState(() {
                          _currentIndex  -= 1 ;
                        });
                      }
                    },
                    onStepTapped: (index){
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                    type: StepperType.horizontal,
                    physics: const ScrollPhysics(
                      parent: ScrollPhysics()
                    ),
                
                    currentStep: _currentIndex, steps: <Step>[
                  Step(title: Text("Enter name"), content: TextField()),
                  Step(title: Text("Enter name"), content: TextField()),
                  Step(title: Text("Enter name"), content: TextField()),
                  Step(title: Text("Enter name"), content: TextField()),
                
                ]),
              ),
            ),
            Text("$_currentIndex"),
          ],
        ),
      ),
    );
  }
}
