import 'package:color_pallete/copy/domain/bloc/copy_bloc.dart';
import 'package:color_pallete/copy/repository/copy_repository_impl.dart';
import 'package:color_pallete/grid/data/repository/color_repository_impl.dart';
import 'package:color_pallete/grid/domain/bloc/color_box_bloc.dart';
import 'package:color_pallete/page/colored_box_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

void main() {
  GetIt.I.registerSingleton<ColorRepositoryImpl>(ColorRepositoryImpl());
  GetIt.I.registerSingleton<CopyRepositoryImpl>(CopyRepositoryImpl());
  runApp(const ColorPalleteApp());
}

class ColorPalleteApp extends StatelessWidget {
  const ColorPalleteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                ColorBoxBloc(colorRepository: GetIt.I<ColorRepositoryImpl>())
                  ..add(LoadColorBoxEvent()),
          ),
          BlocProvider(
              create: (context) =>
                  CopyBloc(copyRepositoryImpl: GetIt.I<CopyRepositoryImpl>()))
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: ColoredBoxPage(),
        ));
  }
}
