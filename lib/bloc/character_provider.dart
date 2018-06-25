import 'package:flutter/widgets.dart';
import 'package:flutter_rick/api/repository.dart';
import 'package:flutter_rick/bloc/character_bloc.dart';

class CharacterProvider extends InheritedWidget {
  final CharacterBloc characterBloc;

  CharacterProvider({Key key, CharacterBloc characterBloc, Widget child})
      : characterBloc = characterBloc ?? CharacterBloc(Repository()),
        super(child: child, key: key);

  static CharacterBloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(CharacterProvider)
              as CharacterProvider)
          .characterBloc;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}
