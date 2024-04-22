import 'package:color_pallete/util/constants.dart';
import 'package:color_pallete/widget/appstyle.dart';
import 'package:flutter/material.dart';

class TitleColorWidget extends StatelessWidget {
  final String title;
  const TitleColorWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: appstyle(30, AppConst.black, FontWeight.w700),
    );
  }
}
