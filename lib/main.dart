import 'package:animate_do/animate_do.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodgo/colors/app_colors.dart';
import 'package:foodgo/cubit/bottom_bar/main_cubit.dart';
import 'package:foodgo/cubit/forgot_pasword/forgot_cubit.dart';
import 'package:foodgo/cubit/home/home_cubit.dart';
import 'package:foodgo/cubit/search/search_cubit.dart';
import 'package:foodgo/cubit/sign_up/sign_up_cubit.dart';
import 'package:foodgo/screens/auth/splash_screen.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import 'gen/assets.gen.dart';

void main() async {
  await GetStorage.init();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => HomeCubit()),
        BlocProvider(create: (context) => ForgotCubit()),
        BlocProvider(create: (context) => SearchCubit()),
        BlocProvider(create: (context) => MainCubit()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  late Stream<List<ConnectivityResult>> _internetState;
  GlobalKey<NavigatorState> _navigatorKey = GlobalKey();
  bool isBottomOpen = false;

  @override
  void initState() {
    super.initState();
    _internetState = Connectivity().onConnectivityChanged;
    _internetState.listen((status)async{
      print('Status $status');
      if (status.contains(ConnectivityResult.none)) {
        await Future.delayed(Duration(seconds: 3));
        isBottomOpen = true;
        showModalBottomSheet(
          isDismissible: false,
          enableDrag: false,
          context: _navigatorKey.currentContext!,
          builder: (context) => Container(
            height: 500,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10),
            ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(Assets.lotties.disconnect,width: 200,height: 200, fit: BoxFit.contain),
                  Pulse(
                    infinite: true,
                    duration: Duration(seconds: 1),
                    child: Text(
                      'Disconnect',
                      style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  )
                  ],
              ),
          ),
        );
      } else {
        if (isBottomOpen){
          Navigator.pop(_navigatorKey.currentContext!);
          isBottomOpen = false;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     navigatorKey: _navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.white),
      ),
      home: SplashScreen(),
    );
  }
}
