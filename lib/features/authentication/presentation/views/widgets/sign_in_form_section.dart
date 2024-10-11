import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:students_collage/constants.dart';
import 'package:students_collage/core/utils/app_router.dart';
import 'package:students_collage/core/utils/styles.dart';
import 'package:students_collage/features/authentication/presentation/views/widgets/custom_navigator_text_button.dart';
import 'package:students_collage/features/authentication/presentation/views/widgets/custom_text_button.dart';
import 'package:students_collage/features/authentication/presentation/views/widgets/custom_text_form_field.dart';

class SignInFromSection extends StatefulWidget {
  const SignInFromSection({super.key});

  @override
  State<SignInFromSection> createState() => _SignInFromSectionState();
}

class _SignInFromSectionState extends State<SignInFromSection> {
  GlobalKey<FormState> formKey = GlobalKey();
  bool isnull = false;
  Icon emailIcon = const Icon(Icons.email);
  Icon passwordIcon = const Icon(Icons.password);
  Color suffixIconColor = kPrimaryColor;
  bool isSecured = true; 
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Sign In ",
            style: Styles.textStyle24,
          ),
          const SizedBox(
            height: 20,
          ),

          const SizedBox(),
          CustomTextFormField(
            hintText: "Email ",
            suffixIconColor: suffixIconColor,
            suffixIcon: IconButton(
              onPressed: () {},
              icon: emailIcon,
            ),
          ),
          const SizedBox(
            height: 15,
          ),

          CustomTextFormField(
            hintText: "Password",
            suffixIconColor: suffixIconColor,
            isSecured: isSecured,
            suffixIcon: IconButton(
              onPressed: () {
                if (isSecured == true) {
                  setState(() {
                    passwordIcon = const Icon(Icons.remove_red_eye);
                    isSecured = false;
                  });
                } else {
                  setState(() {
                     passwordIcon = const Icon(Icons.password);
                  isSecured = true;
                  });
                 
                }
              },
              icon: passwordIcon,
            ),
          ),
          const SizedBox(
            height: 10,
          ),

          Row(
            children: [
              CustomTextButton(
                  text: "Sign in ",
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                    } else {
                      setState(() {
                        suffixIconColor = Colors.red;
                      });
                    }
                  }),
              const SizedBox(
                width: 7,
              ),
              const Text(
                "Forget your password ?",
                style: Styles.textStyle12,
              )
            ],
          ),

          const SizedBox(
            height: 15,
          ),

          const Align(
            child: Text(
              "Don't have an account ? ",
              style: Styles.textStyle14,
            ),
          ),
          //  Align(child: Text(" Sign up " , style: Styles.textStyle14,),),
          Align(
              child: CustomNavigatorTextButton(
                  text: "Sign up",
                  onPressed: () {
                    GoRouter.of(context).push(AppRouter.kRegisterview);
                  }))
        ],
      ),
    );
  }
}
