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

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(_character.name),
      ),
      body: new Card(
        margin: EdgeInsets.all(8.0),
        color:
            _character.status == "Alive" ? Colors.green[700] : Colors.red[300],
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _createImageAvatar(_character.image),
            _createListTile(Icons.person, _character.name, text_theme),
            _createListTile(Icons.person_pin, _character.species, text_theme),
            _createListTile(Icons.face, _character.gender, text_theme),
            _createListTile(Icons.home, _character.originName, text_theme),
            _createListTile(Icons.my_location, _character.lastLocation, text_theme),
          ],
        ),
      ),
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

  Widget _createImageAvatar(String imageUrl) {
    return new Container(
      margin: EdgeInsets.only(top: 16.0),
      width: 200.0,
      height: 200.0,
      decoration: new BoxDecoration(
        shape: BoxShape.circle,
        image: new DecorationImage(
            image: new NetworkImage(imageUrl), fit: BoxFit.cover),
      ),
    );
  }
}
