import 'package:color_pallete/grid/data/model/color_model.dart';
import 'package:color_pallete/util/parse_hex_to_color.dart';
import 'package:color_pallete/widget/colors_container_widget.dart';
import 'package:color_pallete/widget/title_wodget.dart';
import 'package:flutter/material.dart';

class ColoredDetailPage extends StatelessWidget {
  final ColorModel colorModel;

  const ColoredDetailPage({super.key, required this.colorModel});

  @override
  Widget build(BuildContext context) {
    final colorInt = parseHexToColor(colorModel.value!);
    final appBarHeight = MediaQuery.of(context).size.height / 2;

    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: colorInt,
          expandedHeight: appBarHeight,
        ),
        SliverPadding(
          padding: const EdgeInsets.only(left: 16, top: 32, right: 16),
          sliver: SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleColorWidget(title: colorModel.name),
                const SizedBox(height: 16),
                ColorsContainerWidget(
                    title: 'Hex', value: colorModel.value!.replaceAll('#', '')),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ColorsContainerWidget(
                        title: 'Red', value: '${colorInt.red}'),
                    ColorsContainerWidget(
                        title: 'Green', value: '${colorInt.green}'),
                    ColorsContainerWidget(
                        title: 'Blue', value: '${colorInt.blue}'),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    ));
  }
}
