import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:students_collage/core/utils/app_router.dart';
import 'package:students_collage/core/widgets/custom_snack_bar.dart';
import 'package:students_collage/features/authentication/presentation/manager/save_user_info_into_firestore/cubit/save_user_info_into_firestore_cubit.dart';
import 'package:students_collage/features/authentication/presentation/views/widgets/details_form_container.dart';

class DetailsFromSection extends StatefulWidget {
  const DetailsFromSection({super.key, required this.email});

  final String email;

  @override
  State<DetailsFromSection> createState() => _DetailsFromSectionState();
}

class _DetailsFromSectionState extends State<DetailsFromSection> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SaveUserInfoIntoFirestoreCubit,
        SaveUserInfoIntoFirestoreState>(
      listener: (context, state) {
        if (state is SaveUserInfoIntoFirestoreSuccess) {
          GoRouter.of(context).push(AppRouter.kHomeView, extra: widget.email);
        } else if ( state is SaveUserInfoIntoFirestoreFailure){
           customSnackBar(errMessage: state.errMessage, context: context);
        }
      },
      builder: (context, state) {
       return ModalProgressHUD(
        inAsyncCall: state is SaveUserInfoIntoFirestoreloading ,
         child:  SingleChildScrollView(
            child: DetailsFormContainer(email: widget.email,),
          ),
       );
      },
    );
  }
}
