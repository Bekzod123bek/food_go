import 'package:flutter/material.dart';
import 'package:foodgo/colors/app_colors.dart';
import 'package:foodgo/screens/auth/login_screen.dart';
import 'package:foodgo/screens/auth/sigup_screen.dart';
import 'package:foodgo/widgets/eleveted_widget.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../gen/assets.gen.dart';
import '../../widgets/eleveted_iconbutton.dart';

class LoginOrSignup extends StatefulWidget {
  const LoginOrSignup({super.key});

  @override
  State<LoginOrSignup> createState() => _LoginOrAuthState();
}

class _LoginOrAuthState extends State<LoginOrSignup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              SizedBox(height: 100),

              Center(
                child: SizedBox(
                  width: 144,
                  height: 179,

                  child: Image.asset(
                    Assets.images.logoPng.path,

                    fit: BoxFit.contain,
                  ),
                ),
              ),

              SizedBox(height: 100),

              Elevated_button(
                text: 'Log In',
                onPresed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
              ),

              SizedBox(height: 30),

              Elevated_button(
                text: 'Sign Up',
                color: AppColors.white,
                textcolor: AppColors.green,
                borderColor: AppColors.green,
                onPresed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Signup_Screen()),
                  );
                },
              ),

              SizedBox(height: 50),

              Row(
                children: [
                  const Expanded(
                    child: Divider(color: Colors.grey, thickness: 1),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'Or',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  const Expanded(
                    child: Divider(color: Colors.grey, thickness: 2),
                  ),
                ],
              ),

              SizedBox(height: 50),

              Eleveted_iconbutton(
                iconSvg: Assets.icons.google,
                text: 'Continue with Google',
                onPressed: () {},
              ),
              SizedBox(height: 20),

              Eleveted_iconbutton(
                iconSvg: Assets.icons.facebook,
                text: 'Continue with Facebook',
                onPressed: () {},
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
