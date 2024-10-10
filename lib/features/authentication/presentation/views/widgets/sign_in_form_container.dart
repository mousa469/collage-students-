import 'package:flutter/material.dart';
import 'package:students_collage/constants.dart';
import 'package:students_collage/core/utils/app_router.dart';
import 'package:students_collage/core/utils/styles.dart';
import 'package:students_collage/features/authentication/presentation/views/widgets/custom_navigator_text_button.dart';
import 'package:students_collage/features/authentication/presentation/views/widgets/custom_text_button.dart';
import 'package:students_collage/features/authentication/presentation/views/widgets/custom_text_form_field.dart';
import 'package:students_collage/features/authentication/presentation/views/widgets/from_section.dart';

class SignInFormContainer extends StatelessWidget {
  const SignInFormContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 35,
      child: SizedBox(
        height: 450,
        child: AspectRatio(
          aspectRatio: 0.77,
          child: Container(
            decoration: BoxDecoration(
                color: kSecondaryColor,
                borderRadius: BorderRadius.circular(16)),
            child: const  Padding(
              padding:  EdgeInsets.all(30.0),
              child: FromSection()
            ),
          ),
        ),
      ),
    );
  }
}
