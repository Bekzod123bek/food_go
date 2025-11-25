import 'package:bloc/bloc.dart';
import 'package:foodgo/cubit/sign_up/sign_up_state.dart';
import 'package:foodgo/service/storage_service.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());

  Future<void> signUp({required String email, required String password}) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        StorageService.writeData(email, 'email');
        StorageService.writeData(password, 'password');
        emit(AuthSuccessState());
      } else {
        emit(AuthErrorState());
        print('hozirgi xolat $state');
        print('error is empty info');
      }
    } catch (e) {
      emit(AuthErrorState());
      print('signUp xatolik boldi $e');
    }
  }

  Future<void> logIn({required String email, required String password}) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        print('ifga kirdim');
        String cacheEmail = await StorageService.getInfo('email');
        String cachePassword = await StorageService.getInfo('password');
        print('read qilindi >>>>>');
        print(cacheEmail);
        print(cachePassword);
        if (email == cacheEmail && password == cachePassword) {
          emit(AuthSuccessState());
        } else {
          emit(AuthErrorState());
        }
      } else {
        emit(AuthErrorState());
      }
    } catch (e) {
      emit(AuthErrorState());
    }
  }
}
