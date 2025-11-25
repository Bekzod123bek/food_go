
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../colors/app_colors.dart';

class Eleveted_iconbutton extends StatelessWidget {
  final String iconSvg;
  final String text;
  final VoidCallback? onPressed;

  const Eleveted_iconbutton({
    super.key,
    required this.text,
    this.onPressed, required this.iconSvg,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.white,
          elevation: 0,
          side: const BorderSide(color: Color(0xffEDEDED), width: 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(iconSvg,height: 20, width: 20, fit: BoxFit.contain,),
            const SizedBox(width: 8),
            Text(
              text,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}