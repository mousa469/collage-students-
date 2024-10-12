
import 'package:flutter/material.dart';

  void customSnackBar({required String errMessage , required BuildContext context  }) {
    SnackBar snackBar = SnackBar(
      content: Text(errMessage),
      duration: const Duration(seconds: 2),
    );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

