import 'package:color_pallete/copy/domain/bloc/copy_bloc.dart';
import 'package:color_pallete/util/constants.dart';
import 'package:color_pallete/widget/appstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ColorsContainerWidget extends StatelessWidget {
  final String title;
  final String value;
  const ColorsContainerWidget(
      {super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.read<CopyBloc>().add(CopyValueEvent(value: value)),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                  color: AppConst.shadowBlack,
                  blurRadius: 12,
                  offset: Offset(0, 12),
                  spreadRadius: 0)
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: appstyle(16, AppConst.black, FontWeight.w400),
            ),
            const SizedBox(width: 8),
            Text(
              value,
              style: appstyle(16, AppConst.black, FontWeight.w400),
            )
          ],
        ),
      ),
    );
  }
}
