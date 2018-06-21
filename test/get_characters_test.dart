import 'package:flutter_rick/api/repository.dart';
import 'package:flutter_rick/models/character.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:flutter_rick/utils/configs.dart';

class MockClient extends Mock implements http.Client {}

void main() {
  http.Client client;
  Repository _repository;
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
    client = new MockClient();
    _repository = new Repository();
  });

  group('getCharacters', () {
    test('get list of characters if http call is successful', () async {
      when(client.get(Configurations.CHAR_URL))
          .thenAnswer((_) async => http.Response(_responseString, 200));
      var characterList = await _repository.getCharacters(client);
      expect(characterList, isNotNull);
      expect(characterList, isInstanceOf<List<Character>>());
      expect(characterList.length, 1);
    });

    test('fetched list element is a Character', () async {
      when(client.get(Configurations.CHAR_URL))
          .thenAnswer((_) async => http.Response(_responseString, 200));
      var characterList = await _repository.getCharacters(client);
      var testCharacter = characterList[0];
      expect(testCharacter, isInstanceOf<Character>());
      expect(testCharacter.name, "Rick Sanchez");
    });

    test('throw exception if http call fails with error', () async {
      when(client.get(Configurations.CHAR_URL))
          .thenAnswer((_) async => http.Response('Not found', 404));
      expect(_repository.getCharacters(client), throwsException);
    });
  });
}
