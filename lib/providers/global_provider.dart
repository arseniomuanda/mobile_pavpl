import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_pavpl/app/data/dummy_data.dart';

var visitaProvider = StateProvider((ref) => Visita());

var prisonerProvider = StateProvider((ref) => Prisoner());

var tabIndexProvider = StateProvider((ref)=> int);


class HomeState extends ChangeNotifier {
  int bottomIndex = 0;
  PageController homePageController = PageController(
    initialPage: 0,
  );

  void changeBottomIndex(int index) {
    bottomIndex = index;
    homePageController.jumpToPage(index);
    notifyListeners();
  }
}

final homeState = ChangeNotifierProvider((ref) => HomeState());