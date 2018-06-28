import 'package:flutter/material.dart';
import 'package:flutter_rick/bloc/page_indicator_provider.dart';
import 'package:flutter_rick/pages/character_pager_view.dart';

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
      home: PageIndicatorProvider(child: CharacterPager()),
    );
  }
}
