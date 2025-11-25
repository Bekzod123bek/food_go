import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../colors/app_colors.dart';

class Elevated_button extends StatelessWidget {
  final String text;
  final VoidCallback? onPresed;
  final Color? color;
  final Color? textcolor;
  final Color? borderColor;
  final double? borderWidth;

  const Elevated_button({
    super.key,
    required this.text,
    this.onPresed,
    this.color,
    this.textcolor,
    this.borderColor,
    this.borderWidth,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: onPresed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? AppColors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side:
                borderColor !=
                    null
                ? BorderSide(
                    color: borderColor!,
                    width: borderWidth ?? 1,
                  )
                : BorderSide.none,
          ),
          elevation: 0,
        ),
        child: Text(
          text,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: textcolor ?? Colors.white,
          ),
        ),
      ),
    );
  }
}
