import 'dart:async';
import 'package:flutter_rick/api/repository.dart';
import 'package:flutter_rick/models/character.dart';
import 'package:rxdart/rxdart.dart';

class CharacterFilterBloc {

  final Repository repository;

  Stream<List<Character>> _filer_results = Stream.empty();
  Stream<String> _log = Stream.empty();

  ReplaySubject<String> _query = ReplaySubject<String>();

  Stream<List<Character>> get filterResults => _filer_results;
  Stream<String> get log => _log;
  Sink<String> get query => _query;

  CharacterFilterBloc() {

  }


}