import 'dart:convert';

import 'package:color_pallete/grid/data/model/color_model.dart';
import 'package:color_pallete/grid/data/repository/color_repository.dart';
import 'package:flutter/services.dart';

class ColorRepositoryImpl implements ColorRepository {
  @override
  Future<List<ColorModel>> getColors() async {
    try {
      await Future.delayed(const Duration(seconds: 2));

      String data = await loadAssets('assets/json/color.json');
      final Map<String, dynamic> json = jsonDecode(data);
      final colors = <ColorModel>[];

      if (json['colors'] != null) {
        for (var e in json['colors']) {
          if (e['value'] != null) {
            colors.add(ColorModel.fromJson(e));
          }
        }
        return colors;
      }
      return [];
    } on Exception catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<String> loadAssets(String path) async {
    return rootBundle.loadString(path);
  }
}
