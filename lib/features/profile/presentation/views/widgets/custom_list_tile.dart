import 'package:flutter/material.dart';
import 'package:students_collage/core/utils/styles.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile(
      {super.key, required this.title, required this.subTitle, required this.customIcon});

  final String title;
  final String subTitle;
  final IconData? customIcon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width* .16,
      height: MediaQuery.of(context).size.height* .16,
      child: ListTile(
        
        leading:  Icon(
          customIcon,
          size: 25,
        ),
        title: Text(
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          title,
          style: Styles.textStyle16,
        ),
        subtitle: Text(subTitle,
            style: Styles.textStyle12
                .copyWith(color: const  Color.fromARGB(199, 158, 158, 158))),
      ),
    );
  }
}
