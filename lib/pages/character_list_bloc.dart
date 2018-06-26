import 'package:flutter/material.dart';
import 'package:flutter_rick/api/repository.dart';
import 'package:flutter_rick/bloc/character_bloc.dart';
import 'package:flutter_rick/bloc/character_provider.dart';
import 'package:flutter_rick/models/character.dart';
import 'package:flutter_rick/pages/character_detail.dart';
import 'package:flutter_rick/pages/character_search_bloc.dart';
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
          return new CustomScrollView(
            primary: false,
            slivers: <Widget>[
              new SliverPadding(
                padding: const EdgeInsets.all(8.0),
                sliver: new SliverGrid.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  children: _createCharacterCard(characters, context),
                ),
              )
            ],
          );
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

  List<Widget> _createCharacterCard(
      List<Character> characters, BuildContext context) {
    List<Widget> elementWidgetList = new List<Widget>();

    if (characters != null) {
      for (int i = 0; i < characters.length; i++) {
        Character character = characters[i];

        var listItem = new GestureDetector(
          onTap: () {
            Navigator.of(context).push(
                  new MaterialPageRoute(
                    builder: (BuildContext context) =>
                        new CharacterDetail(character),
                  ),
                );
          },
          child: new GridTile(
            child: new Hero(
              tag: character.id,
              child: new Image.network(
                character.image,
                fit: BoxFit.cover,
              ),
            ),
            footer: new GridTileBar(
              backgroundColor: Colors.black45,
              title: new Center(
                child: new Text(
                  character.name,
                  softWrap: true,
                ),
              ),
              subtitle: new Center(
                child: new Text(character.status),
              ),
            ),
          ),
        );
        elementWidgetList.add(listItem);
      }
    }
    return elementWidgetList;
  }
}
