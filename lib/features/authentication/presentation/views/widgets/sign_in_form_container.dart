import 'package:flutter/material.dart';
import 'package:students_collage/constants.dart';
import 'package:students_collage/features/authentication/presentation/views/widgets/sign_in_form_section.dart';

class SignInFormContainer extends StatelessWidget {
  const SignInFormContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 45,
      child: SizedBox(
        height: 400,
        child: AspectRatio(
          aspectRatio: 0.77,
          child: Container(
            decoration: BoxDecoration(
                color: kSecondaryColor,
                borderRadius: BorderRadius.circular(16)),
            child: const Padding(
                padding: EdgeInsets.all(30.0), child: SingleChildScrollView(child: SignInFromSection())),
          ),
        ),
      ),
    );
  }
}
