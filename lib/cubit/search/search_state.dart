


import 'package:foodgo/model/food_model.dart';

abstract class SearchState {}

class SearchInitialState extends SearchState{}
class SearchLoadingState extends SearchState{}
class SearchErrorState extends SearchState{}
class SearchSuccessState extends SearchState{

  final List<Resturant> data;

  SearchSuccessState({ required this.data});
}