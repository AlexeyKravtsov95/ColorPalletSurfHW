import 'package:color_pallete/util/constants.dart';
import 'package:color_pallete/widget/appstyle.dart';
import 'package:flutter/material.dart';

void showSnackBar({required BuildContext context, required String message}) {
  if (!context.mounted) return;

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(milliseconds: 900),
      behavior: SnackBarBehavior.floating,
      padding: const EdgeInsets.all(24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      backgroundColor: AppConst.snackBlack,
      elevation: 0,
      content: Center(
        child: Text(
          message,
          style: appstyle(16, Colors.white, FontWeight.w400),
        ),
      ),
    ),
  );
}
