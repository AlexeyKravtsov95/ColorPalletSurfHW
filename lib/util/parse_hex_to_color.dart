import 'dart:ui';

Color parseHexToColor(String color) {
  return Color(int.parse('0xFF${color.replaceAll('#', '')}'));
}
