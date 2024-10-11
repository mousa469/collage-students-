import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:students_collage/constants.dart';
import 'package:students_collage/core/utils/styles.dart';
import 'package:students_collage/features/authentication/presentation/views/widgets/custom_navigator_text_button.dart';
import 'package:students_collage/features/authentication/presentation/views/widgets/custom_text_button.dart';
import 'package:students_collage/features/authentication/presentation/views/widgets/custom_text_form_field.dart';

class RegisterFormSection extends StatefulWidget {
  const RegisterFormSection({super.key});

  @override
  State<RegisterFormSection> createState() => _RegisterFormSectionState();
}

class _RegisterFormSectionState extends State<RegisterFormSection> {
  GlobalKey<FormState> formKey = GlobalKey();

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
            "Sign up ",
            style: Styles.textStyle24,
          ),
          const SizedBox(
            height: 20,
          ),

          const SizedBox(),
          CustomTextFormField(
            hintText: "Email",
            suffixIconColor: suffixIconColor,
            suffixIcon: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.email),
            ),
          ),
          const SizedBox(
            height: 10,
          ),

          CustomTextFormField(
            hintText: "Password",
            suffixIconColor: suffixIconColor,
            isSecured: isSecured,
            suffixIcon: IconButton(
              onPressed: () {
                if (isSecured == true) {
                  setState(() {
                    passwordIcon = const  Icon(Icons.remove_red_eye);
                    isSecured = false;
                  });
                } else {
                  setState(() {
                      passwordIcon = const  Icon(Icons.password);
                    isSecured = true ;
                  });
                
                }
              },
              icon: passwordIcon,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          CustomTextFormField(
            hintText: "Universty",
            suffixIconColor: suffixIconColor,
            isSecured: true,
            suffixIcon: IconButton(
              onPressed: () {},
              icon: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.account_balance)),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          CustomTextFormField(
            hintText: "Phone number",
            suffixIconColor: suffixIconColor,
            isSecured: true,
            suffixIcon: IconButton(
              onPressed: () {},
              icon: IconButton(onPressed: () {}, icon: const Icon(Icons.phone)),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          CustomTextFormField(
            hintText: "Father number",
            suffixIconColor: suffixIconColor,
            isSecured: true,
            suffixIcon: IconButton(
              onPressed: () {},
              icon: IconButton(onPressed: () {}, icon: const Icon(Icons.phone)),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          CustomTextFormField(
            hintText: "Address",
            suffixIconColor: suffixIconColor,
            isSecured: true,
            suffixIcon: IconButton(
              onPressed: () {},
              icon: IconButton(onPressed: () {}, icon: const Icon(Icons.home)),
            ),
          ),
          const SizedBox(
            height: 10,
          ),

          Align(
            child: CustomTextButton(
                text: "Sign up ",
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                  } else {
                    setState(() {
                      suffixIconColor = Colors.red;
                    });
                  }
                }),
          ),
          const SizedBox(
            width: 7,
          ),

          const SizedBox(
            height: 15,
          ),

          const Align(
            child: Text(
              "already have an account ? ",
              style: Styles.textStyle14,
            ),
          ),
          //  Align(child: Text(" Sign up " , style: Styles.textStyle14,),),
          Align(
              child: CustomNavigatorTextButton(
                  text: "Sign in",
                  onPressed: () {
                    GoRouter.of(context).pop();
                  }))
        ],
      ),
    );
  }
}
