import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const String _title = 'Widget Example';

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: WidgetApp(),
    );
  }
}

class WidgetApp extends StatefulWidget {
  const WidgetApp({super.key});

  @override
  _WidgetExampleState createState() => _WidgetExampleState();
}

class _WidgetExampleState extends State<WidgetApp> {
  String res = '';
  TextEditingController value1 = TextEditingController();
  TextEditingController value2 = TextEditingController();
  final List _buttonList = ['더하기', '빼기', '곱하기', '나누기'];
  final List<DropdownMenuItem<String>> _dropDownMenuItems = List.empty(growable: true);
  String? _buttonText;

  @override
  void initState() {
    super.initState();

    for(var item in _buttonList) {
      _dropDownMenuItems.add(DropdownMenuItem(value: item, child: Text(item)));
    }
    _buttonText = _dropDownMenuItems[0].value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget Example'),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  '결과 : $res',
                  style: const TextStyle(fontSize: 20)
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: value1
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                    keyboardType: TextInputType.number,
                    controller: value2
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.amber)
                  ),
                  onPressed: () {
                    setState(() {
                      double value1Int = double.parse(value1.value.text);
                      double value2Int = double.parse(value2.value.text);
                      double? result;

                      switch (_buttonText) {
                        case '더하기':
                          result = value1Int + value2Int;
                          break;
                        case '빼기':
                          result = value1Int - value2Int;
                          break;
                        case '곱하기':
                          result = value1Int * value2Int;
                          break;
                        case '나누기':
                          result = value1Int / value2Int;
                          break;
                      }

                      res = '$result';
                    });
                  },
                  child: Row(
                    children: <Widget>[
                      const Icon(Icons.add),
                      Text(_buttonText!)
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: DropdownButton(
                  items: _dropDownMenuItems,
                  onChanged: (String? value) {
                    setState(() {
                      _buttonText = value;
                    });
                  },
                  value: _buttonText,
                )
              )
            ]
          )
        )
      )
    );
  }
}
