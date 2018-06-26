import 'package:flutter/material.dart';
import 'package:flutter_rick/api/repository.dart';
import 'package:flutter_rick/models/character.dart';
import 'package:flutter_rick/pages/character_detail.dart';
import 'package:flutter_rick/pages/character_list_bloc_screen.dart';
import 'package:flutter_rick/widgets/character_grid.dart';
import 'package:http/http.dart' as http;

class CharacterList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Repository repo = new Repository();
    http.Client client = new http.IOClient();

    return Scaffold(
      appBar: new AppBar(
        title: new Text('RickOPedia Vanilla'),
      ),
      body: new FutureBuilder(
        future: repo.getCharacters(),
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
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
          Icons.swap_calls,
          size: 30.0,
        ),
        onPressed: () => Navigator.of(context).push(
              new MaterialPageRoute(
                builder: (BuildContext context) => CharacterListBlocScreen(),
              ),
            ),
      ),
    );
  }
}
