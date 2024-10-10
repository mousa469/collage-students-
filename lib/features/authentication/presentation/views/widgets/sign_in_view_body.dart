import 'package:flutter/material.dart';
import 'package:students_collage/features/authentication/presentation/views/widgets/auth_empty_background.dart';
import 'package:students_collage/features/authentication/presentation/views/widgets/sign_in_form_container.dart';

class SignInViewBody extends StatelessWidget {
  const SignInViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const  Center(
      child: Stack(
        children: [
           AuthEmptyBackground() ,
      
      
           SignInFormContainer()
        ],
      ),
    );
  }
}


