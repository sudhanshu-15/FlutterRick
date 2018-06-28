import 'package:flutter/material.dart';
import 'package:flutter_rick/bloc/page_indicator_provider.dart';
import 'package:flutter_rick/pages/character_list.dart';
import 'package:flutter_rick/pages/character_list_bloc_screen.dart';
import 'package:flutter_rick/pages/character_search_bloc_screen.dart';

class CharacterPager extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pageIndicator = PageIndicatorProvider.of(context);
    return Scaffold(
      body: PageView(
        children: <Widget>[
          CharacterList(),
          CharacterListBlocScreen(),
        ],
        onPageChanged: pageIndicator.pageNumber.add,
        controller: pageIndicator.pageController,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.search,
          size: 30.0,
        ),
        onPressed: () => Navigator.of(context).push(
              new MaterialPageRoute(
                builder: (context) => CharacterSearchBlocScreen(),
              ),
            ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.green,
        hasNotch: true,
        child: StreamBuilder(
          stream: pageIndicator.currentPage,
          builder: (context, snapshot) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.details),
                    iconSize: snapshot.data == 0 ? 34.0 : 24.0,
                    color:
                        snapshot.data == 0 ? Colors.amberAccent : Colors.white,
                    onPressed: () => pageIndicator.pageNumber.add(0),
                  ),
                  IconButton(
                    icon: Icon(Icons.layers),
                    iconSize: snapshot.data == 1 ? 34.0 : 24.0,
                    color:
                        snapshot.data == 1 ? Colors.amberAccent : Colors.white,
                    onPressed: () => pageIndicator.pageNumber.add(1),
                  ),
                ],
              ),
        ),
      ),
    );
  }
}
