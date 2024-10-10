import 'package:flutter/material.dart';
import 'package:students_collage/constants.dart';
import 'package:students_collage/core/utils/styles.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton(
      {super.key, required this.text, required this.onPressed});

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style:const  ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(kPrimaryColor),
      ),
      child:  Padding(
        padding: const  EdgeInsets.symmetric( horizontal:  15 , vertical: 10) ,
        child: Text(
          text,
          style:  Styles.textStyle14.copyWith(color: kSecondaryColor),
        ),
      ),
    );
  }
}
