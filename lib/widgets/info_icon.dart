import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../colors/app_colors.dart';

class InfoIcon extends StatelessWidget {
  final String icon;
  final String text;
  final double size;
  final Color? iconColor;

   const InfoIcon({
    super.key,
    required this.icon,
    required this.text,
    this.size = 19.0,
    this.iconColor = AppColors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: size,
          height: size,
          child: SvgPicture.asset(
            icon,
            colorFilter: ColorFilter.mode(iconColor!, BlendMode.srcIn),
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(width: 12),
        Text(
          text,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: iconColor,
          ),
        ),
      ],
    );
  }
}