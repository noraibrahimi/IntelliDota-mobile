import 'dart:math';

import 'package:charts_flutter/flutter.dart';
import 'package:charts_flutter/src/text_element.dart';
import 'package:charts_flutter/src/text_style.dart' as style;

class CustomCircleSymbolRenderer extends CircleSymbolRenderer {
  String text;

  CustomCircleSymbolRenderer();

  @override
  void paint(ChartCanvas canvas, Rectangle<num> bounds,
      {List<int> dashPattern,
      Color fillColor,
      Color strokeColor,
      double strokeWidthPx}) {
    super.paint(canvas, bounds,
        dashPattern: dashPattern,
        fillColor: fillColor,
        strokeColor: strokeColor,
        strokeWidthPx: strokeWidthPx);
    canvas.drawRect(
        Rectangle(bounds.left - 10, bounds.top - 45,
            bounds.width + (text.length - 1) * 4, bounds.height *5),
        fill: Color.white);
    var textStyle = style.TextStyle();
    textStyle.color = Color.black;
    textStyle.fontSize = 15;
    canvas.drawText(TextElement(text, style: textStyle), (bounds.left - 8).round(),
        (bounds.top - 40).round());
  }
}
