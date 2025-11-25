import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodgo/colors/app_colors.dart';
import 'package:foodgo/cubit/sign_up/sign_up_cubit.dart';
import 'package:foodgo/cubit/sign_up/sign_up_state.dart';
import 'package:foodgo/screens/home/main_screen.dart';
import 'package:foodgo/service/auth_validators.dart';
import 'package:foodgo/widgets/custom_snack_bar.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../gen/assets.gen.dart';
import '../../widgets/eleveted_iconbutton.dart';
import '../../widgets/eleveted_widget.dart';
import '../../widgets/text_filed.dart';

class Signup_Screen extends StatefulWidget {
  const Signup_Screen({super.key});

  @override
  State<Signup_Screen> createState() => _Signup_ScreenState();
}

class _Signup_ScreenState extends State<Signup_Screen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    confirmPasswordController.addListener(() {
      setState(() {});
      passwordController.addListener(() {
        setState(() {});
      });
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(
      builder: (context, isKeyboardVisible) => Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Visibility(
          visible: isKeyboardVisible == true,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Elevated_button(
              color:
                  confirmPasswordController.text.isNotEmpty &&
                      passwordController.text.isNotEmpty &&
                      (confirmPasswordController.text ==
                          passwordController.text)
                  ? AppColors.green
                  : AppColors.grey,
              text: 'Sign up',
              onPresed: () {
                if (confirmPasswordController.text.isNotEmpty &&
                    passwordController.text.isNotEmpty &&
                    confirmPasswordController.text == passwordController.text) {
                  if (_formKey.currentState!.validate()) {
                    context.read<AuthCubit>().signUp(
                      email: emailController.text,
                      password: passwordController.text,
                    );
                  }
                }
              },
            ),
          ),
        ),
        backgroundColor: AppColors.white,
        appBar: AppBar(
          toolbarHeight: 80,
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Text(
            'Sign Up',
            style: GoogleFonts.poppins(
              color: AppColors.white,
              fontSize: 25,
              fontWeight: FontWeight.w500,
            ),
          ),
          backgroundColor: AppColors.green,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
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
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => MainScreen()),
                (_) => false,
              );
            }
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 56),

                  Form(
                    key: _formKey,

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Email',
                          style: GoogleFonts.poppins(
                            color: AppColors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),

                        SizedBox(height: 12),

                        TextFiled(
                          validator: AuthValidators.emailValidator,
                          textInputType: TextInputType.emailAddress,
                          text: 'Text your email',
                          controller: emailController,
                        ),

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
                          validator: AuthValidators.passwordValidator,
                          textInputType: TextInputType.number,
                          text: 'Text your password',
                          controller: passwordController,
                        ),

                        SizedBox(height: 20),

                        Text(
                          'Confirm password',
                          style: GoogleFonts.poppins(
                            color: AppColors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 12),

                        TextFiled(
                          validator: AuthValidators.passwordValidator,

                          textInputType: TextInputType.number,

                          text: 'Text your password',
                          controller: confirmPasswordController,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 40),
                  Visibility(
                    visible: isKeyboardVisible == false,
                    child: Elevated_button(
                      color: Colors.grey,
                      text: 'Sign up',
                      onPresed: () {},
                    ),
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
                    onPressed: () {},
                  ),
                  SizedBox(height: 20),

                  Eleveted_iconbutton(
                    iconSvg: Assets.icons.facebook,
                    text: 'Continue with Facebook',
                    onPressed: () {},
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
