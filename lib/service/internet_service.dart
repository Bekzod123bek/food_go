




import 'package:connectivity_plus/connectivity_plus.dart';

class InternetService {

  static   Connectivity connnectivivty =Connectivity();
  static Stream<bool> checkInternet()async*{
    print('Internet ishga tushid');

    try{
      bool isInternet = true;
      Connectivity().onConnectivityChanged.listen((status){
        if(status.contains(ConnectivityResult.none)){
          isInternet = false;

        }else{
          isInternet = true;
        }
      });
       yield isInternet;

    }catch(e){
      print('Internet erviceda xatolik');

    }

  }

}