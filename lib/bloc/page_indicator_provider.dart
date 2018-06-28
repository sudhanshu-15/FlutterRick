import 'package:flutter/material.dart';
import 'package:flutter_rick/bloc/page_indicator_bloc.dart';

class PageIndicatorProvider extends InheritedWidget {
  final PageIndicatorBloc pageIndicatorBloc;

  PageIndicatorProvider(
      {Key key, PageIndicatorBloc pageIndicatorBloc, Widget child})
      : pageIndicatorBloc = pageIndicatorBloc ?? PageIndicatorBloc(),
        super(child: child, key: key);

  static PageIndicatorBloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(PageIndicatorProvider)
              as PageIndicatorProvider)
          .pageIndicatorBloc;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}
