import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:students_collage/core/widgets/custom_error_message.dart';
import 'package:students_collage/core/widgets/custom_loading_indicator.dart';
import 'package:students_collage/features/profile/presentation/manager/profile%20data%20cubit/cubit/profile_data_cubit.dart';
import 'package:students_collage/features/profile/presentation/views/widgets/custom_list_tile.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key, required this.email});

  final String email;

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<ProfileDataCubit>(context)
        .fetchUserData(email: widget.email);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileDataCubit, ProfileDataState>(
      builder: (context, state) {
        if (state is ProfileDataSuccess) {
          
          return ListView.builder(
            itemCount:state.userData.length,
            itemBuilder: (context, index) {
              return CustomListTile(
                title: BlocProvider.of<ProfileDataCubit>(context).titles[index],
                subTitle:state.userData[index] ,
                customIcon: BlocProvider.of<ProfileDataCubit>(context).icons[index],
              );
            },
          );
        } else if (state is ProfileDataFailure) {
          return CustomErrorMessage(errMessage: state.errMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
