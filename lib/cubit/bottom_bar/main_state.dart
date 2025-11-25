import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodgo/screens/home/home_page.dart';
import 'package:foodgo/screens/home/profile_screen.dart';
import 'package:foodgo/screens/search/search_screen.dart';

abstract class MainState {}

class MainInitialState extends MainState {
  int currentIndex = 0;

  List<Widget> pages = [HomePage(), SearchScreen(hasBack: false,),ProfileScreen(),];

  MainInitialState({required this.currentIndex});
}
