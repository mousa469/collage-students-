import 'package:flutter/material.dart';
import 'package:students_collage/features/authentication/presentation/views/widgets/details_form_section.dart';

class UserDetailsBody extends StatelessWidget {
  const UserDetailsBody({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(20),
      child: DetailsFromSection(email: email,)
    );
  }
}
