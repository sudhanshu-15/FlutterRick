import 'package:flutter/material.dart';
import 'package:flutter_rick/api/repository.dart';
import 'package:flutter_rick/models/character.dart';

class CharacterList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Repository repo = new Repository();

    return new FutureBuilder(
        future: repo.getCharacters(),
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          if (!snapshot.hasData) {
            return new Center(
              child: new CircularProgressIndicator(),
            );
          }
          List characters = snapshot.data;
          print(characters);
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
        });
  }

  List<Widget> _createCharacterCard(
      List<Character> characters, BuildContext context) {
    List<Widget> elementWidgetList = new List<Widget>();

    if (characters != null) {
      for (int i = 0; i < characters.length; i++) {
        Character character = characters[i];

        var listItem = new GestureDetector(
          onTap: () {
            print("${character.name} was clicked");
          },
          child: new GridTile(
            child: new Image.network(
              character.image,
              fit: BoxFit.cover,
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