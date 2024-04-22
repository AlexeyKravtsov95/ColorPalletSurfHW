import 'package:color_pallete/grid/data/model/color_model.dart';

abstract interface class ColorRepository {
  Future<List<ColorModel>> getColors();
  Future<String> loadAssets(String path);
}
