import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../colors/app_colors.dart';

class TextFiled extends StatelessWidget {
  final String text;
  final TextEditingController controller;
  final TextInputType? textInputType;
  final String? Function(String?)? validator;
  final  void Function(String)? onChanged;

  const TextFiled( {  super.key, required this.text, required this.controller, this.textInputType, this.validator,this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged:onChanged ,
      validator: validator,
      keyboardType: textInputType ?? TextInputType.multiline,
      textInputAction: TextInputAction.next,
      controller: controller,
      decoration: InputDecoration(
        hintText: text,
        hintStyle: GoogleFonts.poppins(
          color: AppColors.grey,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        filled: true,
        fillColor: AppColors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.lightgrey, width: 1),
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.lightgrey, width: 1),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.green, width: 1),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      ),
      style: GoogleFonts.poppins(fontSize: 14),
    );
  }
}
