import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodgo/cubit/home/home_state.dart';
import 'package:foodgo/model/food_model.dart';

import '../../gen/assets.gen.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeLoadingState()) {
    getResturants();
  }

  Future<void> getResturants() async {
    try {
      await Future.delayed(Duration(seconds: 2));
      final result = await rootBundle.loadString(Assets.mock.mockData);
      final temp = json.decode(result);
      print("JssgSghaywarhgonh $temp");

      final data = FoodModel.fromJson(temp);
      emit(HomeSuccessState(data: data));
    } catch (e) {
      emit(HomeErrorState());
    }
  }
}
