import 'package:flutter/material.dart';
import 'package:flutter_rick/models/character.dart';

class CharacterDetail extends StatelessWidget {
  Character _character;

  CharacterDetail(this._character);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(_character.name),
      ),
      body: new Card(
        margin: EdgeInsets.all(8.0),
        color: Colors.green[700],
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new Padding(
              padding: const EdgeInsets.all(8.0),
              child: new GridTile(child: new Image.network(_character.image)),
            ),
            new ListTile(
              leading: new Icon(
                Icons.person,
                size: 40.0,
                color: Colors.white,
              ),
              title: new Text(
                _character.name,
                style: Theme
                    .of(context)
                    .textTheme
                    .title
                    .copyWith(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
