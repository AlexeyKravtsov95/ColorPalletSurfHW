part of 'color_box_bloc.dart';

@immutable
sealed class ColorBoxState {}

class ColorBoxLoading extends ColorBoxState {}

class ColorBoxSuccess extends ColorBoxState {
  final List<ColorModel> colorData;

  ColorBoxSuccess({required this.colorData});
}

class ColorBoxFailure extends ColorBoxState {
  final String errorMessage;

  ColorBoxFailure(this.errorMessage);
}
