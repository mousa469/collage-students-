import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key, required this.suffixIcon, this.isSecured = false, required this.suffixIconColor, required this.hintText});

  final IconButton suffixIcon;
  final bool isSecured;
 final  Color suffixIconColor ;
 final String hintText ;

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
        hintText: hintText  ,
        
        
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
