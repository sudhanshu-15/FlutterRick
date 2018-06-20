import 'package:flutter/material.dart';
import 'package:flutter_rick/models/character.dart';

class CharacterDetail extends StatelessWidget {
  Character _character;

  CharacterDetail(this._character);

  static const icon_size = 40.0;

  @override
  Widget build(BuildContext context) {
    var text_theme =
        Theme.of(context).textTheme.title.copyWith(color: Colors.white);

    Widget _generatePortraitScreen() {
      return new Container(
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            stops: [0.1, 0.5, 0.7, 0.9],
            colors: _character.status == "Alive"
                ? [
                    Colors.green[600],
                    Colors.green[500],
                    Colors.blue[400],
                    Colors.blue[200]
                  ]
                : [
                    Colors.red[600],
                    Colors.red[400],
                    Colors.deepOrange[400],
                    Colors.deepOrange[200],
                  ],
          ),
        ),
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _createImageAvatar(_character.id, _character.image),
            _createListTile(Icons.person, _character.name, text_theme),
            _createListTile(Icons.person_pin, _character.species, text_theme),
            _createListTile(Icons.face, _character.gender, text_theme),
            _createListTile(Icons.home, _character.originName, text_theme),
            _createListTile(
                Icons.my_location, _character.lastLocation, text_theme),
          ],
        ),
      );
    }

    Widget _generateLandscapeScreen() {
      return new Container(
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            stops: [0.1, 0.5, 0.7, 0.9],
            colors: _character.status == "Alive"
                ? [
                    Colors.green[600],
                    Colors.green[500],
                    Colors.blue[400],
                    Colors.blue[200]
                  ]
                : [
                    Colors.red[600],
                    Colors.red[400],
                    Colors.deepOrange[400],
                    Colors.deepOrange[200],
                  ],
          ),
        ),
        child: new Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _createImageAvatar(_character.id, _character.image),
            new Expanded(
              flex: 1,
              child: new Padding(
                padding: const EdgeInsets.all(8.0),
                child: new Column(
                  children: <Widget>[
                    _createListTile(Icons.person, _character.name, text_theme),
                    _createListTile(
                        Icons.person_pin, _character.species, text_theme),
                    _createListTile(Icons.face, _character.gender, text_theme),
                    _createListTile(
                        Icons.home, _character.originName, text_theme),
                    _createListTile(
                        Icons.my_location, _character.lastLocation, text_theme),
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(_character.name),
      ),
      body: new Card(
          margin: EdgeInsets.all(8.0),
          child: MediaQuery.of(context).orientation == Orientation.portrait
              ? _generatePortraitScreen()
              : _generateLandscapeScreen()),
    );
  }

  Widget _createListTile(IconData icon, String text, TextStyle textTheme) {
    return new ListTile(
        leading: new Icon(
          icon,
          size: icon_size,
          color: Colors.white,
        ),
        title: new Text(
          text,
          style: textTheme,
        ));
  }

  Widget _createImageAvatar(int id, String imageUrl) {
    return new Hero(
      tag: id,
      child: new Container(
        margin: EdgeInsets.all(16.0),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
          shape: BoxShape.circle,
          image: new DecorationImage(
              image: new NetworkImage(imageUrl), fit: BoxFit.cover),
        ),
      ),
    );
  }
}
