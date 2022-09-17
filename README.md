# nigeria_states_dropdown
A flutter package for showing a states and town cities. In addition it gives the possibility to select a list of States and town depends on Selected.

<img src="https://bensonarafat.com/packages/Screenshot_1663435379.png" width="240"/>

<img src="https://bensonarafat.com/packages/Screenshot_1663435379.png" width="240"/>

## Usage

To use this Package, add `nigeria_states_dropdown` as a [dependency in your pubspec.yaml](https://flutter.io/platform-plugins/).



```dart
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
```

To call feedback or getting data from this widget, you can make function in onChanged

### Example


```dart
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

```

### Reference

- nigeria-state-city-api [
nigeria-state-city-api](https://github.com/realArafatBen/nigeria-state-city-api)
