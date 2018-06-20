import 'package:flutter/material.dart';
import 'package:flutter_rick/pages/character_list.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.green,
      ),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('RickOPedia'),
          backgroundColor: Colors.green[400],
        ),
        body: new CharacterList(),
      ),
    );
  }
}
