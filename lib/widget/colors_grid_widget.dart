import 'package:color_pallete/copy/domain/bloc/copy_bloc.dart';
import 'package:color_pallete/grid/data/model/color_model.dart';
import 'package:color_pallete/page/colored_detail_page.dart';
import 'package:color_pallete/util/constants.dart';
import 'package:color_pallete/util/parse_hex_to_color.dart';
import 'package:color_pallete/widget/appstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ColorGridWidget extends StatelessWidget {
  final List<ColorModel> colorModel;
  const ColorGridWidget({super.key, required this.colorModel});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 20,
          mainAxisExtent: 180,
        ),
        itemCount: colorModel.length,
        itemBuilder: (context, index) {
          final color = colorModel[index];
          final Color colorValue = color.value != null
              ? parseHexToColor(color.value!)
              : Colors.white;
          if (color.value == null) {
            return const SizedBox();
          }
          return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ColoredDetailPage(colorModel: colorModel[index])));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    tag: color.value!,
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: colorValue),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    color.name,
                    style: appstyle(12, AppConst.black, FontWeight.w400),
                  ),
                  InkWell(
                    onLongPress: () => context
                        .read<CopyBloc>()
                        .add(CopyValueEvent(value: color.value!)),
                    child: Text(
                      color.value!,
                      style: appstyle(12, AppConst.black, FontWeight.w400),
                    ),
                  ),
                ],
              ));
        });
  }
}
