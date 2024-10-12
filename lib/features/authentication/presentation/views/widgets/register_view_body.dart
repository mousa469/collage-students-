import 'package:flutter/material.dart';
import 'package:students_collage/features/authentication/presentation/views/widgets/auth_empty_background.dart';
import 'package:students_collage/features/authentication/presentation/views/widgets/register_form_container.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const  Center(
      child: Stack(
        children: [
           AuthEmptyBackground() ,
      
      
           RegisterFormContainer()
        ],
      ),
    );
  }
}




