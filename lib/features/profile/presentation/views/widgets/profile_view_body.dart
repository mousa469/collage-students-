import 'package:flutter/material.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(email),
    );
  }
}
