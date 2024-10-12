import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:students_collage/constants.dart';
import 'package:students_collage/core/utils/app_router.dart';
import 'package:students_collage/core/widgets/custom_snack_bar.dart';
import 'package:students_collage/features/authentication/presentation/manager/auth_cubit/cubit/auth_cubit.dart';
import 'package:students_collage/features/authentication/presentation/views/widgets/sign_in_form_section.dart';

class SignInFormContainer extends StatelessWidget {
  const SignInFormContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          GoRouter.of(context).push(AppRouter.kHomeView, extra: state.email);
          customSnackBar(
              errMessage: "signed in successfully", context: context);
        }
        if (state is Authfailure) {
          customSnackBar(errMessage: state.errMessage, context: context);
        }
      },
      builder: (context, state) {
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
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: ModalProgressHUD(
                    inAsyncCall: state is Authloading,
                    child: const SingleChildScrollView(
                      child: SignInFromSection(),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
