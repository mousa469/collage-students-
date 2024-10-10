import 'package:flutter/material.dart';
import 'package:students_collage/constants.dart';
import 'package:students_collage/core/utils/app_router.dart';
import 'package:students_collage/core/utils/styles.dart';
import 'package:students_collage/features/authentication/presentation/views/widgets/custom_navigator_text_button.dart';
import 'package:students_collage/features/authentication/presentation/views/widgets/custom_text_button.dart';
import 'package:students_collage/features/authentication/presentation/views/widgets/custom_text_form_field.dart';

class FromSection extends StatefulWidget {
  const FromSection({super.key});

  @override
  State<FromSection> createState() => _FromSectionState();
}

class _FromSectionState extends State<FromSection> {
  GlobalKey<FormState> formKey = GlobalKey();
  bool isnull = false;
  Icon emailIcon = const Icon(Icons.email);
  Icon passwordIcon = const Icon(Icons.password);
  Color suffixIconColor = kPrimaryColor;
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
          const Text(
            "username or email",
            style: Styles.textStyle14,
          ),
          const SizedBox(),
          CustomTextFormField(
            suffixIconColor: suffixIconColor,
            suffixIcon: IconButton(
              onPressed: () {},
              icon: emailIcon,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Password",
            style: Styles.textStyle14,
          ),
          CustomTextFormField(
            suffixIconColor: suffixIconColor,
            isSecured: true,
            suffixIcon: IconButton(
              onPressed: () {},
              icon: passwordIcon,
            ),
          ),
          const SizedBox(
            height: 5,
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
          const Align(
              child: CustomNavigatorTextButton(
                  text: "Sign up", onPressedLocation: AppRouter.kRegisterview))
        ],
      ),
    );
  }
}
