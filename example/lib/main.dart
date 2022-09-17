import 'package:flutter/material.dart';
import 'package:nigeria_states_dropdown/nigeria_states_dropdown.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Nigeria State Drop Down'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              NigeriaStatesDropDown(
                onStateChange: (String state) {
                  print("State $state");
                  setState(() {});
                },
                onTownChange: (String town) {
                  setState(() {
                    print("Town $town");
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
