
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:foodgo/cubit/search/search_state.dart';
import 'package:foodgo/model/food_model.dart';

import '../../gen/assets.gen.dart';

class SearchCubit extends Cubit<SearchState>{
  SearchCubit(): super(SearchInitialState());

  Future<void> searchResturants(String input)async{

    try{
      emit(SearchLoadingState());
      final result = await rootBundle.loadString(Assets.mock.mockData);
      final temp = json.decode(result);
      final FoodModel data = FoodModel.fromJson(temp);
       Set<Resturant> searchItems = {}  ;

      for (var i = 0; i < data.resturants.length; i++) {
        if (data.resturants[i].name.toLowerCase().contains(input.toLowerCase()) && input.isNotEmpty) {
          searchItems.add(data.resturants[i]);
          print("Malumot topildi ${data.resturants[i].name}");
        }
      }
      emit(SearchSuccessState(data: searchItems.toList()));

    }catch(e){
   emit(SearchErrorState());
    }

  }

  void chiqish (){
    emit(SearchInitialState());
  }

}