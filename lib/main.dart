import 'package:flutter/material.dart';
import 'package:flutter_rick/pages/character_list.dart';
import 'package:flutter_rick/pages/character_list_bloc.dart';

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
      home: CharacterList(),
    );
  }
}
