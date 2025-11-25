import 'package:foodgo/model/food_model.dart';

abstract class HomeState {}

class HomeLoadingState extends HomeState {}

class HomeErrorState extends HomeState {}
class HomeSuccessState extends HomeState {
  final FoodModel data;

  HomeSuccessState({ required this.data});


}

