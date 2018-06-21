import 'dart:convert';

import 'package:flutter_rick/api/repository.dart';
import 'package:flutter_rick/models/character.dart';
import 'package:test/test.dart';

void main() {
  Repository repository;
  JsonDecoder _jsonDecoder;
  var _jsonResponse;

  var _responseString = """{
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

  setUp(() {
    repository = new Repository();
    _jsonDecoder = new JsonDecoder();
    _jsonResponse = _jsonDecoder.convert(_responseString);
  });

  group("Character list creation test", () {
    test("Character list test", () {
      List<Character> characters = repository.getCharacterList(_jsonResponse);
      expect(characters, isNotNull);
      expect(characters.length, 1);
    });

    test("Character creation test", () {
      Character testCharacter = Character.map(_jsonResponse["results"][0]);
      expect(testCharacter, isNotNull);
      expect(testCharacter.name, "Rick Sanchez");
    });
  });
}