import 'package:flutter/material.dart';
import 'package:students_collage/constants.dart';



class AuthEmptyBackground extends StatelessWidget {
  const AuthEmptyBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
            padding: const EdgeInsets.only(left: 40),
            child: SizedBox(
              height: 490,
              child: AspectRatio(
                aspectRatio: 0.6,
                child: Container(
                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(16)),
                ),
              ),
            ),
          );
  }
}