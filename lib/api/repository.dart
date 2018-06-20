import 'dart:async';

import 'package:flutter_rick/api/api.dart';
import 'package:flutter_rick/models/character.dart';

class Repository {
  NetworkUtil _networkUtil = new NetworkUtil();
  static final BASE_URL = "https://rickandmortyapi.com/api/";
  static final CHAR_URL = BASE_URL + "character/";
  static final EPISODE_URL = BASE_URL + "episode/";

  Future<List<Character>> getCharacters() async {
    return _networkUtil.get(CHAR_URL).then(getCharacterList);
  }

  List<Character> getCharacterList(dynamic res) {
    if (res["error"] != null) return null;
    var result = res["results"];
    List<Character> characterList = List<Character>();
    result.forEach((element) => characterList.add(Character.map(element)));
    return characterList;
  }
}