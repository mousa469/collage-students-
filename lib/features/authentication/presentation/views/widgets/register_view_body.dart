import 'package:flutter/material.dart';
import 'package:students_collage/constants.dart';
import 'package:students_collage/core/utils/app_router.dart';
import 'package:students_collage/core/utils/styles.dart';
import 'package:students_collage/features/authentication/presentation/views/widgets/auth_empty_background.dart';
import 'package:students_collage/features/authentication/presentation/views/widgets/custom_navigator_text_button.dart';
import 'package:students_collage/features/authentication/presentation/views/widgets/custom_text_button.dart';
import 'package:students_collage/features/authentication/presentation/views/widgets/custom_text_form_field.dart';
import 'package:students_collage/features/authentication/presentation/views/widgets/sign_in_form_section.dart';
import 'package:students_collage/features/authentication/presentation/views/widgets/register_form_container.dart';
import 'package:students_collage/features/authentication/presentation/views/widgets/sign_in_form_container.dart';

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




