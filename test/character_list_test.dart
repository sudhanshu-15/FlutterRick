import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_rick/models/character.dart';
import 'package:flutter_rick/pages/character_detail.dart';
import 'package:flutter_rick/pages/character_list.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
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

  testWidgets('Character List Widget test', (WidgetTester tester) async {
    HttpOverrides.runZoned(() async {
      await tester.pumpWidget(new MaterialApp(home: new CharacterList()));

//      Iterable<Widget> listOfWidgets = tester.allWidgets;
//      for (Widget widget in listOfWidgets) {
//        print(widget);
//      }

      //Look for progressbar
      final progressbar = find.byType(CircularProgressIndicator);
      expect(progressbar, findsOneWidget);

    }, createHttpClient: createMockHttpClient);
  });
}

MockHttpClient createMockHttpClient(SecurityContext _) {

  const _responseString = """{
	"info": {
		"count": 394,
		"pages": 20,
		"next": "https://rickandmortyapi.com/api/character/?page=2",
		"prev": ""
	},
	"results": [{
		"id": 1,
		"name": "Rick Sanchez",
		"status": "Alive",
		"species": "Human",
		"type": "",
		"gender": "Male",
		"origin": {
			"name": "Earth",
			"url": "https://rickandmortyapi.com/api/location/1"
		},
		"location": {
			"name": "Earth",
			"url": "https://rickandmortyapi.com/api/location/20"
		},
		"image": "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
		"episode": [
			"https://rickandmortyapi.com/api/episode/1",
			"https://rickandmortyapi.com/api/episode/2"
		],
		"url": "https://rickandmortyapi.com/api/character/1",
		"created": "2017-11-04T18:48:46.250Z"
	}]
}""";

  final MockHttpClient client = new MockHttpClient();
  final MockHttpClientRequest request = new MockHttpClientRequest();
  final MockHttpClientResponse response = new MockHttpClientResponse();
  final MockHttpHeaders headers = new MockHttpHeaders();
  when(client.getUrl(typed(any))).thenReturn(new Future<HttpClientRequest>.value(request));
  when(request.headers).thenReturn(headers);
  when(request.close()).thenReturn(new Future<HttpClientResponse>.value(response));
  when(response.contentLength).thenReturn(_responseString.length);
  when(response.statusCode).thenReturn(HttpStatus.OK);
}
