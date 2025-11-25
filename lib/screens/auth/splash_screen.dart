import 'dart:async';

import 'package:flutter/material.dart';
import 'package:foodgo/colors/app_colors.dart';
import 'package:foodgo/screens/auth/on_boarding.dart';
import 'package:foodgo/screens/home/main_screen.dart';
import 'package:foodgo/service/storage_service.dart';

import '../../gen/assets.gen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void checkLogin() async {
    final email = await StorageService.getInfo('email');
    if (email != null && email.toString().isNotEmpty) {
      Navigator.pushAndRemoveUntil(
         context,
        MaterialPageRoute(builder: (context) => MainScreen()),
        (_) => false,
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnBoarding()),
      );
    }
  }

  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      checkLogin();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: SizedBox(
          width: 144,
          height: 179,
          child: Image.asset(
            Assets.images.logoPng.path,
            fit: BoxFit.cover,

            errorBuilder: (context, error, stackTrace) {
              return Text('Rasm Yullanmadi');
            },
          ),
        ),
      ),
    );
  }
}
