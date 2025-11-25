import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodgo/colors/app_colors.dart';
import 'package:foodgo/cubit/sign_up/sign_up_cubit.dart';
import 'package:foodgo/cubit/sign_up/sign_up_state.dart';
import 'package:foodgo/screens/auth/forgot_screen.dart';
import 'package:foodgo/widgets/custom_snack_bar.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../gen/assets.gen.dart';
import '../../widgets/eleveted_iconbutton.dart';
import '../../widgets/eleveted_widget.dart';
import '../../widgets/text_filed.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isChecked = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.white,
      appBar: AppBar(
        toolbarHeight: 80,
        centerTitle: true,
        automaticallyImplyLeading: false,

        title: Text(
          'Log In',
          style: GoogleFonts.poppins(
            color: AppColors.white,
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: AppColors.green,
        leading: IconButton(
          onPressed: () {

          },
          icon: SvgPicture.asset(
            Assets.icons.left,
            width: 28,
            height: 28,
            colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),
          ),
        ),
      ),

      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthErrorState) {
            CustomSnackBar.showErrorSnackBar(context);
          } else if (state is AuthSuccessState) {
            CustomSnackBar.showSuccessSnackBar(context);
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 56),

              Text(
                'Email',
                style: GoogleFonts.poppins(
                  color: AppColors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),

              SizedBox(height: 12),

              TextFiled(text: 'Text your email', controller: emailController),

              SizedBox(height: 12),
              Text(
                'Password',
                style: GoogleFonts.poppins(
                  color: AppColors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),

              SizedBox(height: 12),

              TextFiled(
                text: 'Text your password',
                controller: passwordController,
              ),

              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Transform.scale(
                    scale: 0.9,
                    child: Checkbox(
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value ?? false;
                        });
                      },
                      activeColor: AppColors.lightgreen,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      visualDensity: VisualDensity.compact,
                    ),
                  ),
                  Text(
                    'Remember me',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: AppColors.black,
                    ),
                  ),

                  Spacer(),

                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Forgot_Screen(),
                        ),
                      );
                    },
                    child: Text(
                      'Forgot password?',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: AppColors.grey,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 40),

              Elevated_button(
                text: 'Log IN',
                onPresed: () {
                  context.read<AuthCubit>().logIn(
                    email: emailController.text,
                    password: passwordController.text,
                  );
                },
              ),
              SizedBox(height: 40),

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
                onPressed: () {
                  emailController.clear();
                },
              ),
              SizedBox(height: 20),

              Eleveted_iconbutton(
                iconSvg: Assets.icons.facebook,
                text: 'Continue with Facebook',
                onPressed: () {},
              ),
              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Dont’t have an account?',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: AppColors.grey,
                    ),
                  ),
                  Text(
                    ' Register',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: AppColors.blue,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
