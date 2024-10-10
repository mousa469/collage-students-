import 'package:flutter/material.dart';
import 'package:students_collage/constants.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key, required this.suffixIcon, this.isSecured = false, required this.suffixIconColor});

  final IconButton suffixIcon;
  final bool isSecured;
 final  Color suffixIconColor ;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "field is required ";
        }
        return null;
      },
      obscureText: isSecured,
      style: const TextStyle(fontSize: 12),
      
      decoration: InputDecoration(
        
        
        suffixIcon: suffixIcon,
        suffixIconColor:  suffixIconColor,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(color: Color(0xffd6deed))),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(color: Color(0xffd6deed))),
      ),
    );
  }
}
