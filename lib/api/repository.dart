import 'dart:async';

import 'package:flutter_rick/api/api.dart';
import 'package:flutter_rick/models/character.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_rick/utils/configs.dart';

class Repository {
  NetworkUtil _networkUtil = new NetworkUtil();
  http.Client client = new http.IOClient();

  Future<List<Character>> getCharacters() async {
    return _networkUtil.get(client, Configurations.CHAR_URL).then(getCharacterList);
  }

  List<Character> getCharacterList(dynamic res) {
    if (res["error"] != null) return null;
    var result = res["results"];
    List<Character> characterList = List<Character>();
    result.forEach((element) => characterList.add(Character.map(element)));
    return characterList;
  }
}