import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomSnackBar {
  static showErrorSnackBar(BuildContext context) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.red,
          content: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.error, color: Colors.white),
              SizedBox(width: 10),
              Text('Something went wrong !'),
            ],
          ),
        ),
      );

  static showSuccessSnackBar(BuildContext context) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.green,
          content: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.error, color: Colors.white),
              SizedBox(width: 10),
              Text('Welcome'),
            ],
          ),
        ),
      );
}
