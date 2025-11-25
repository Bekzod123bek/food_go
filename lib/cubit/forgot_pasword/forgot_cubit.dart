import 'package:bloc/bloc.dart';
import 'package:foodgo/cubit/forgot_pasword/forgot_state.dart';
import 'package:foodgo/service/storage_service.dart';

class ForgotCubit extends Cubit<ForgetState> {
  ForgotCubit() : super(ForgetInitialState());

  void checkUserEmail(String email) async {
    final cacheEmail = await StorageService.getInfo('email');
    if (email == cacheEmail) {
      emit(ForgetSuccessState());
    }else{
      emit(ForgetErorState());
    }
  }
}
