import 'package:flutter/material.dart';
import 'package:students_collage/features/authentication/presentation/views/widgets/user_details_body.dart';

class UserDetailsView extends StatelessWidget {
  const UserDetailsView({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: UserDetailsBody(email: email ,),
    );
  }
}
