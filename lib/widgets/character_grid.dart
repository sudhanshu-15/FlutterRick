import 'package:flutter/material.dart';
import 'package:flutter_rick/models/character.dart';
import 'package:flutter_rick/pages/character_detail.dart';

class CharacterGrid extends StatelessWidget {

  List<Character> _characters;

  CharacterGrid(this._characters);

  @override
  Widget build(BuildContext context) {
    return new CustomScrollView(
      primary: false,
      slivers: <Widget>[
        new SliverPadding(
          padding: const EdgeInsets.all(8.0),
          sliver: new SliverGrid.count(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            children: _createCharacterCard(_characters, context),
          ),
        )
      ],
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