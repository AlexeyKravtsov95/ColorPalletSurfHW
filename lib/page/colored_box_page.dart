import 'package:color_pallete/copy/domain/bloc/copy_bloc.dart';
import 'package:color_pallete/grid/domain/bloc/color_box_bloc.dart';
import 'package:color_pallete/util/constants.dart';
import 'package:color_pallete/widget/appstyle.dart';
import 'package:color_pallete/widget/colors_grid_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widget/snack_bar.dart';

class ColoredBoxPage extends StatefulWidget {
  const ColoredBoxPage({super.key});

  @override
  State<ColoredBoxPage> createState() => _ColoredBoxPageState();
}

class _ColoredBoxPageState extends State<ColoredBoxPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocListener<CopyBloc, CopyState>(
        listener: (context, state) {
          return switch (state) {
            CopyInitial() => null,
            CopyValue() => showSnackBar(context: context, message: state.value),
            CopyFailure() =>
              showSnackBar(context: context, message: state.errorMessage),
          };
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 60, left: 10, right: 10),
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(AppConst.mainAppBarTitle,
                      style: appstyle(30, AppConst.black, FontWeight.w700)),
                ),
              ),
              BlocBuilder<ColorBoxBloc, ColorBoxState>(
                  builder: (context, state) {
                return switch (state) {
                  ColorBoxLoading() => const SliverFillRemaining(
                      child: Center(child: CircularProgressIndicator())),
                  ColorBoxSuccess(colorData: final colorModel) => SliverPadding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      sliver: ColorGridWidget(colorModel: colorModel),
                    ),
                  ColorBoxFailure() => const Text('Something wrong...'),
                };
              })
            ],
          ),
        ),
      ),
    );
  }
}
