import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:foodgo/colors/app_colors.dart';
import 'package:foodgo/screens/auth/login_or_signup.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../gen/assets.gen.dart';
import '../../widgets/eleveted_widget.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 100),
        
            SizedBox(
              width: double.infinity,
              height: 450,
              child: SlideInUp(
                  delay: Duration(seconds: 1),
                  from: 1000,
                  child: Image.asset(Assets.images.men.path, fit: BoxFit.cover)),
            ),
            SizedBox(height: 20),
        
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24),
        
              height: 380,
              width: double.infinity,
              child: Column(
                children: [
                   FadeIn(
                    child: Text(
                      'Explore nowto \nexperience the benefits',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
        
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: FadeIn(
                      child: Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore ',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.grey,
                        ),
                      ),
                    ),
                  ),
        
                  const SizedBox(height: 60),
        
                  ElasticInRight(
                    child: Elevated_button(
                      text: 'Get Started',
                      onPresed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => LoginOrSignup()),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
        
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
