import 'package:color_pallete/copy/repository/copy_repository.dart';
import 'package:flutter/services.dart';

class CopyRepositoryImpl implements CopyRepository {
  @override
  Future<String> copyValue(String value) async {
    try {
      await Clipboard.setData(ClipboardData(text: value));
      final copyData = await Clipboard.getData(Clipboard.kTextPlain);
      if (copyData != null) {
        return copyData.text!;
      }
      throw Exception('something wrong...');
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}
