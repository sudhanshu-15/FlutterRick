import 'dart:async';
import 'package:flutter_rick/api/repository.dart';
import 'package:flutter_rick/models/character.dart';
import 'package:rxdart/rxdart.dart';

class CharacterFilterBloc {
  final Repository repository;

  Stream<List<Character>> _filerResults = Stream.empty();
  Stream<String> _log = Stream.empty();

  ReplaySubject<String> _query = ReplaySubject<String>();

  Stream<List<Character>> get filterResults => _filerResults;
  Stream<String> get log => _log;
  Sink<String> get query => _query;

  CharacterFilterBloc(this.repository) {
    _filerResults = _query
        .distinct()
        .asyncMap(repository.searchCharacters)
        .asBroadcastStream();
    _log = Observable(filterResults)
        .withLatestFrom(_query.stream, (_, query) => 'Results for $query')
        .asBroadcastStream();
  }

  void dispose() {
    _query.close();
  }
}
