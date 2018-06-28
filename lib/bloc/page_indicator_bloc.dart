import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

class PageIndicatorBloc {
  PageController _pageController;

  BehaviorSubject<int> _pageNumber = BehaviorSubject<int>(seedValue: -1);

  Sink<int> get pageNumber => _pageNumber;

  final _currentPage = BehaviorSubject<int>(seedValue: 0);

  Stream<int> get currentPage => _currentPage;

  PageController get pageController => _pageController;

  PageIndicatorBloc() {
    _pageController = PageController();
    _pageNumber.listen((page) {
      if (page > -1) {
        _currentPage.add(page);
        _pageController.animateToPage(
          page,
          duration: const Duration(milliseconds: 300),
          curve: Curves.ease,
        );
      }
    });
  }

  void dispose() {
    _pageController.dispose();
    _pageNumber.close();
  }
}
