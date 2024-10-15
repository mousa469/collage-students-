import 'package:flutter/material.dart';
import 'package:students_collage/constants.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: titles.length,
      itemBuilder: (context, index) {
        return CustomListTile(
          title: titles[index],
          subTitle: "mooasdasd",
          customIcon: Icons.abc_outlined,
        );
      },
    );
  }
}
