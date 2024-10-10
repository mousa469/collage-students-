import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:students_collage/core/utils/app_router.dart';
import 'package:students_collage/core/utils/styles.dart';

class CustomNavigatorTextButton extends StatelessWidget {
  const CustomNavigatorTextButton({super.key, required this.text, required this.onPressedLocation});

  final String text;
  final String onPressedLocation;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          GoRouter.of(context).push(onPressedLocation);
        },
        child: Text(
          text,
          style: Styles.textStyle14.copyWith(color: Colors.black),
        ));
  }
}
