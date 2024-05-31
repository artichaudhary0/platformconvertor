
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage();


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      
        body: Center(
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              SizedBox(
                height: 200,
                width: 600,
                child: Stepper(
                    onStepContinue: () {
                      if (_currentIndex < 3) {
                        setState(() {
                          _currentIndex += 1;
                        });
                      }
                    },
                    onStepCancel: () {
                      if (_currentIndex > 0) {
                        setState(() {
                          _currentIndex -= 1;
                        });
                      }
                    },
                    onStepTapped: (index) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                    type: StepperType.horizontal,
                    physics: const ScrollPhysics(parent: ScrollPhysics()),
                    currentStep: _currentIndex,
                    steps: <Step>[
                      Step(
                        title: const Text("Enter name"),
                        content: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: const TextField(),
                        ),
                      ),
                      const Step(title: Text("Enter name"), content: TextField()),
                      const Step(title: Text("Enter name"), content: TextField()),
                      const Step(title: Text("Enter name"), content: TextField()),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
