import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../colors/app_colors.dart';
import '../../gen/assets.gen.dart';

class Verify_Screen extends StatefulWidget {
  const Verify_Screen({super.key});

  @override
  State<Verify_Screen> createState() => _Verify_ScreenState();
}

class _Verify_ScreenState extends State<Verify_Screen> {
  int seconds = 120;

  Stream<int>countDown()async*{
    if(seconds !=0){
      await Future.delayed(Duration(seconds: 1));
      seconds--;
    }else{
      return;
    }
    setState(() {

    });
  }

  String formatSeconds(Duration d){
    final millis = d.inMilliseconds;
    if(millis>=3600000){
      throw FormatException('too big to format');

    }
    final minutes = _pad2(d.inMinutes);
    final seconds = _pad2(d.inSeconds%60);
    return '$minutes : $seconds';
  }
  String _pad2(int i) => i.toString().padLeft(2,'0');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        toolbarHeight: 80,
        centerTitle: true,
        title: Text(
          'Verify OTP',
          style: GoogleFonts.poppins(
            color: AppColors.white,
            fontSize: 24,
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 32),

              Text(
                'Enter your OTP which has been sent to your email and completely verify your account.',
                style: GoogleFonts.poppins(
                  color: AppColors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),

              const SizedBox(height: 32),



              Center(
                child: Text(
                  'A code has been sent to your phone',
                  style: GoogleFonts.poppins(
                    color: AppColors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(height: 32),

              Center(
                child: StreamBuilder(stream: countDown(), builder: (context,snap){
                  if(seconds == 0){
                    return IconButton(onPressed: (){
                      seconds=120;
                      setState(() {

                      });

                      countDown();
                    }, icon: Icon(Icons.refresh));
                  }else{
                    return Text(formatSeconds(Duration(seconds: seconds)));
                  }

                }),
              ),

              const SizedBox(height: 32),

            ],
          ),
        ),
      ),
    );
  }
}