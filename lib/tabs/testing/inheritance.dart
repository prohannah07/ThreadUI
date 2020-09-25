import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BaseClass(),
    );
  }
}

class BaseClass extends StatefulWidget {
  @override
  _BaseClassState createState() => _BaseClassState();
}

class _BaseClassState extends State<BaseClass> {
  String data1 = "Hello world!";

  void _changeData(String value) {
    setState(() {
      print("Old Value: $data1");
      data1 = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("Data1: $data1");

    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(data1),
          ChildClass(
            parentFunction: _changeData,
          )
        ],
      ),
    );
  }
}

class ChildClass extends StatefulWidget {
  final parentFunction;

  ChildClass({Key key, this.parentFunction}) : super(key: key);

  @override
  _ChildClassState createState() => _ChildClassState();
}

class _ChildClassState extends State<ChildClass> {
  String data2 = "Goodbye";
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        RaisedButton(
          child: Text("Click me!"),
          onPressed: () {
            widget.parentFunction(data2);
          },
        )
      ],
    ));
  }
}
