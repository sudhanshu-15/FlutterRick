import 'package:flutter/material.dart';
import 'package:flutter_rick/api/repository.dart';
import 'package:flutter_rick/bloc/character_filter_bloc.dart';
import 'package:flutter_rick/bloc/character_filter_provider.dart';
import 'package:flutter_rick/models/character.dart';
import 'package:flutter_rick/pages/character_detail.dart';

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
          ),
        ],
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
