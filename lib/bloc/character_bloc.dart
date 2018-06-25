import 'dart:async';
import 'package:flutter_rick/api/repository.dart';
import 'package:flutter_rick/models/character.dart';
import 'package:rxdart/rxdart.dart';

class CharacterBloc {
  final Repository repository;

  Stream<List<Character>> _results = Stream.empty();

  Stream<List<Character>> get results => _results;

  CharacterBloc(this.repository) {
    _results = repository.getCharacters().asStream();
  }
}
