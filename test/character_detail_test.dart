import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_rick/models/character.dart';
import 'package:flutter_rick/pages/character_detail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'MockImageHttpClient.dart';

void main() {
  Character character = new Character(
    1,
    "Rick Sanchez",
    "Alive",
    "Human",
    "Male",
    "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
    "Earth",
    "Earth",
  );

  List<String> expectedTexts = [
    "Rick Sanchez",
    "Human",
    "Male",
    "Earth",
    "Earth"
  ];

  testWidgets('Character Detail Widget test', (WidgetTester tester) async {
    HttpOverrides.runZoned(() async {
      await tester.pumpWidget(new MaterialApp(home: new CharacterDetail(character)));

      //Get list of created widgets
      Iterable<Widget> listOfWidgets = tester.allWidgets;
      checkIfTextsHaveCorrectValue(listOfWidgets, expectedTexts);
    }, createHttpClient: createMockImageHttpClient);
  });
}

void checkIfTextsHaveCorrectValue(Iterable<Widget> widgets, List<String> expectedTexts) {
  var counter = 0;
  for (Widget widget in widgets) {
    if (widget is ListTile) {
      Text title = widget.title;
      expect(title.data, expectedTexts[counter]);
      counter++;
    }
  }
  expect(counter, 5);
}
