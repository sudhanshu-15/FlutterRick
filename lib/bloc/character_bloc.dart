import 'dart:async';
import 'package:flutter_rick/api/repository.dart';
import 'package:flutter_rick/models/character.dart';
import 'package:rxdart/rxdart.dart';

class CharacterBloc {
  final Repository repository;

//  StreamController<List<Character>> _results = StreamController<List<Character>>();
  Stream<List<Character>> _results = Stream<List<Character>>.empty();

  Stream<List<Character>> get results => _results;

  CharacterBloc(this.repository) {
//    repository.getCharacters().then((characters) => _results.add(characters));
    _results = repository.getCharacters().asStream();
  }

//  void dispose() {
//    _results.close();
//  }
}
