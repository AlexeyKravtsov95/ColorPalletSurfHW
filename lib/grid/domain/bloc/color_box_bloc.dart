import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:color_pallete/grid/data/model/color_model.dart';
import 'package:color_pallete/grid/data/repository/color_repository_impl.dart';
import 'package:meta/meta.dart';

part 'color_box_event.dart';
part 'color_box_state.dart';

class ColorBoxBloc extends Bloc<ColorBoxEvent, ColorBoxState> {
  final ColorRepositoryImpl colorRepository;

  ColorBoxBloc({required this.colorRepository}) : super(ColorBoxLoading()) {
    Future<void> getColorPalette(event, emit) async {
      try {
        emit(ColorBoxLoading());
        log('Loading?');
        List<ColorModel> colorModel = await colorRepository.getColors();
        log('Get data ${colorModel.length}');
        emit(ColorBoxSuccess(colorData: colorModel));
      } catch (e) {
        emit(ColorBoxFailure("Failed loading..."));
      }
    }

    on<LoadColorBoxEvent>(getColorPalette);
  }
}
