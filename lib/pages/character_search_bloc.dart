import 'package:flutter/material.dart';
import 'package:flutter_rick/api/repository.dart';
import 'package:flutter_rick/bloc/character_filter_bloc.dart';
import 'package:flutter_rick/bloc/character_filter_provider.dart';
import 'package:flutter_rick/widgets/character_grid.dart';

class CharacterSearchBloc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CharacterFilterProvider(
      characterFilterBloc: CharacterFilterBloc(new Repository()),
      child: _CharacterSearchImpl(),
    );
  }
}

class _CharacterSearchImpl extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final characterFilterBloc = CharacterFilterProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('RickOPedia Search Bloc'),
      ),
      body: Column(
        children: <Widget>[
          new Container(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              onChanged: characterFilterBloc.query.add,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Search a character',
              ),
            ),
          ),
          new StreamBuilder(
            stream: characterFilterBloc.log,
            builder: (context, snapshot) => Container(
                  child: Center(
                    child: Text(
                      snapshot?.data ?? 'Search something dum dum',
                      style: Theme.of(context).textTheme.title,
                    ),
                  ),
                ),
          ),
          Flexible(
            child: new StreamBuilder(
              stream: characterFilterBloc.filterResults,
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
          ),
        ],
      ),
    );
  }
}
