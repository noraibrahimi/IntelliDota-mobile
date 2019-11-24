import 'package:flutter/material.dart';
import 'package:machine_learning/utils/colors.dart';

class PlotPainter extends CustomPainter {
  final List<double> points;
  final int divisions;

  PlotPainter(this.points, {this.divisions});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = AppColors.secondaryColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0
      ..isAntiAlias = true;
    var rect = Rect.fromLTWH(0, 0, size.width, size.height);
    canvas.drawRect(rect, paint);

    for (int i = 0; i <= divisions; i++) {
      canvas.drawLine(
        Offset(0, i * size.height / divisions),
        Offset(size.width, i * size.height / divisions),
        paint,
      );
      canvas.drawLine(
        Offset(i * size.height / divisions, 0),
        Offset(i * size.height / divisions, size.height),
        paint,
      );
    }

    paint..style = PaintingStyle.fill;
    var binWidth = size.width / divisions;
    var binHeight = size.height / divisions;

    var bins = List<List<double>>.generate(
        divisions, (i) => List<double>.generate(divisions, (j) => 0));

    for (int xBin = 0; xBin < divisions; xBin++) {
      int y = 0;
      for (int yBin = xBin * divisions; yBin < divisions * (xBin + 1); yBin++) {
        bins[divisions - 1 - xBin][y++] = points[yBin];
      }
    }

    bins.asMap().forEach((rowIndex, row) {
      row.asMap().forEach((colIndex, col) {
        var left = binWidth * rowIndex;
        var top = binHeight * colIndex;
        var right = binWidth * (rowIndex + 1);
        var bottom = binHeight * (colIndex + 1);
        canvas.drawRRect(
            RRect.fromLTRBR(left, top, right, bottom, Radius.zero),
            paint
              ..color = Colors.white
                  .withOpacity(bins[rowIndex][colIndex].abs().toDouble()));
      });
    });
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
