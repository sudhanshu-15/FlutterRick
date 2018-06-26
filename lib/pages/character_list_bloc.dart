import 'package:flutter/material.dart';
import 'package:flutter_rick/api/repository.dart';
import 'package:flutter_rick/bloc/character_bloc.dart';
import 'package:flutter_rick/bloc/character_provider.dart';
import 'package:flutter_rick/models/character.dart';
import 'package:flutter_rick/pages/character_detail.dart';
import 'package:flutter_rick/pages/character_search_bloc.dart';
import 'package:flutter_rick/widgets/character_grid.dart';
import 'package:http/http.dart' as http;

class CharacterListBloc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CharacterProvider(
      characterBloc: CharacterBloc(new Repository()),
      child: _CharacterListImpl(),
    );
  }
}

class _CharacterListImpl extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final characterBloc = CharacterProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('RickOPedia Bloc'),
      ),
      body: new StreamBuilder(
        stream: characterBloc.results,
        builder: (BuildContext context, snapshot) {
          if (!snapshot.hasData) {
            return new Center(
              child: new CircularProgressIndicator(),
            );
          }
          List characters = snapshot.data;
          return CharacterGrid(characters);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.search,
          size: 30.0,
        ),
        onPressed: () => Navigator.of(context).push(
              new MaterialPageRoute(
                builder: (context) => CharacterSearchBloc(),
              ),
            ),
      ),
    );
  }
}
