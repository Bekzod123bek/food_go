import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodgo/colors/app_colors.dart';
import 'package:foodgo/cubit/forgot_pasword/forgot_cubit.dart';
import 'package:foodgo/screens/auth/verify_screen.dart';
import 'package:foodgo/widgets/custom_snack_bar.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../cubit/forgot_pasword/forgot_state.dart';
import '../../gen/assets.gen.dart';
import '../../widgets/eleveted_widget.dart';
import '../../widgets/text_filed.dart';

class Forgot_Screen extends StatefulWidget {
  const Forgot_Screen({super.key});

  @override
  State<Forgot_Screen> createState() => _Forgot_ScreenState();
}

class _Forgot_ScreenState extends State<Forgot_Screen> {


  final TextEditingController emailController =TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        toolbarHeight: 80,
        centerTitle: true,
        automaticallyImplyLeading: false,

        title: Text(
          'Forgot Password',
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

      body: BlocListener<ForgotCubit,ForgetState>(
        listener: (context,state){
          if(state is ForgetSuccessState){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Verify_Screen()));
          }else if(state is ForgetErorState){
            CustomSnackBar.showErrorSnackBar(context);

          }

        },
        child:  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 56),

                Text(
                  'Enter the email associated with your account and we’ll send an email with code to reset your password',
                  style: GoogleFonts.poppins(
                    color: AppColors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 32),

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

                  textInputType: TextInputType.emailAddress,
                  text: 'Text your email',
                  controller: emailController,
                ),

                SizedBox(height: 40),

                Elevated_button(
                  text: 'Confirm',
                  onPresed: () {
                    context.read<ForgotCubit>().checkUserEmail(emailController.text);
                  },
                ),
                SizedBox(height: 40),
              ],
            ),
          ),

      )
    );
  }
}
