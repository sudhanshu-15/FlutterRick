import 'package:flutter/widgets.dart';
import 'package:flutter_rick/api/repository.dart';
import 'package:flutter_rick/bloc/character_filter_bloc.dart';

class CharacterFilterProvider extends InheritedWidget {
  final CharacterFilterBloc characterFilterBloc;

  CharacterFilterProvider({Key key, CharacterFilterBloc characterFilterBloc, Widget child})
      : characterFilterBloc = characterFilterBloc ?? CharacterFilterBloc(Repository()),
        super(child: child, key: key);

  static CharacterFilterBloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(CharacterFilterProvider)
      as CharacterFilterProvider)
          .characterFilterBloc;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}
