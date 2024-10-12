import 'package:flutter/material.dart';
import 'package:students_collage/core/utils/styles.dart';

class CustomNavigatorTextButton extends StatelessWidget {
  const CustomNavigatorTextButton(
      {super.key, required this.text,  required this.onPressed});

  final String text;

 final  VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: Styles.textStyle14.copyWith(color: Colors.black),
        ));
  }
}
