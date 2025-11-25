import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodgo/cubit/bottom_bar/main_state.dart';

class MainCubit extends Cubit<MainState>{
  MainCubit():super(MainInitialState(currentIndex: 0));


  void onBottonNavBar(int newIndex){
    emit(MainInitialState(currentIndex: newIndex));

  }

}