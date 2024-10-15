import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:students_collage/constants.dart';
import 'package:students_collage/core/utils/styles.dart';
import 'package:students_collage/features/authentication/data/models/student_model.dart';
import 'package:students_collage/features/authentication/presentation/manager/auth_cubit/cubit/auth_cubit.dart';
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
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController universityController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController fatherPhoneNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    nameController.dispose();
    universityController.dispose();
    phoneNumberController.dispose();
    fatherPhoneNumberController.dispose();
    addressController.dispose();
    passwordController.dispose();
  }

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
            controller: emailController,
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
            controller: passwordController,
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
            height: 5,
          ),
          CustomTextFormField(
            controller: nameController,
            hintText: "name",
            suffixIconColor: suffixIconColor,
            suffixIcon: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.boy_rounded),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          CustomTextFormField(
            controller: universityController,
            hintText: "Universty",
            suffixIconColor: suffixIconColor,
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
            controller: phoneNumberController,
            hintText: "Phone number",
            suffixIconColor: suffixIconColor,
            suffixIcon: IconButton(
              onPressed: () {},
              icon: IconButton(onPressed: () {}, icon: const Icon(Icons.phone)),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          CustomTextFormField(
            controller: fatherPhoneNumberController,
            hintText: "Father number",
            suffixIconColor: suffixIconColor,
            suffixIcon: IconButton(
              onPressed: () {},
              icon: IconButton(onPressed: () {}, icon: const Icon(Icons.phone)),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          CustomTextFormField(
            controller: addressController,
            hintText: "Address",
            suffixIconColor: suffixIconColor,
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
                    StudentModel studentModel = StudentModel(
                        address: addressController.text,
                        email: emailController.text,
                        fatherPhoneNumber: fatherPhoneNumberController.text,
                        name: nameController.text,
                        phoneNumber: phoneNumberController.text,
                        university: universityController.text);
                    BlocProvider.of<AuthCubit>(context).registerNewUser(
                        password: passwordController.text,
                        studentModel: studentModel);
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
